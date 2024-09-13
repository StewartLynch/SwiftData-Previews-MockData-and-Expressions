//
//  SampleData.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

struct MockData: PreviewModifier {
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }
    static func makeSharedContext() async throws -> ModelContainer {
        let importData = ImportModel.fetchMockData()
        let container = try! ModelContainer(
            for: Book.self, Author.self, Genre.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        importData?.genres.forEach { genreI in
            let genre = Genre(name: genreI.name, color: genreI.color)
            container.mainContext.insert(genre)
        }
        importData?.authors.forEach{ authorI in
            let author = Author(firstName: authorI.firstName, lastName: authorI.lastName)
            container.mainContext.insert(author)
        }
        
        let genres = try? container.mainContext.fetch(FetchDescriptor<Genre>())
        let authors = try? container.mainContext.fetch(FetchDescriptor<Author>())
        
        if let genres, let authors {
            importData?.books.forEach { bookI in
                // Find the matching genre
                guard let genre = genres.first( where: {$0.name == bookI.genre}) else {
                    print("📍Could not find \(bookI.genre)")
                    return
                }
                // Create a new book with name and genre
                let book = Book(name: bookI.name, genre: genre)
                // append the book to the genre's books array
                genre.books.append(book)
                // find authors
                bookI.authorIds.forEach { authorFullName in
                    guard let author = authors.first(where: {$0.fullName == authorFullName}) else {
                        print("📍Could not find \(authorFullName)")
                        return
                    }
                    // append the author to the books' authors array
                    book.authors.append(author)
                }
                // Insert the book into the database
                container.mainContext.insert(book)
            }
        }
        return container
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var mockData: Self = .modifier(MockData())
}
