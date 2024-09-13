//
//  ContentView.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

struct StartTabView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        TabView {
            Tab("Books", systemImage: "books.vertical") {
                BooksTabView()
            }
            Tab("Authors", systemImage: "person") {
                AuthorsTabView()
            }
            Tab("Genres", systemImage: "swatchpalette") {
                GenresTabView()
            }
        }
        .onAppear {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
//        .onAppear {
//            let importData = ImportModel.fetchMockData()
//            
//            importData?.genres.forEach { genreI in
//                let genre = Genre(name: genreI.name, color: genreI.color)
//                modelContext.insert(genre)
//                try? modelContext.save()
//            }
//            importData?.authors.forEach{ authorI in
//                let author = Author(firstName: authorI.firstName, lastName: authorI.lastName)
//                modelContext.insert(author)
//                try? modelContext.save()
//            }
//            
//            let genres = try? modelContext.fetch(FetchDescriptor<Genre>())
//            let authors = try? modelContext.fetch(FetchDescriptor<Author>())
//            if let genres, let authors {
//                importData?.books.forEach { bookI in
//                    // Find the matching genre
//                    guard let genre = genres.first( where: {$0.name == bookI.genre}) else {
//                        print("🇨🇦 Could not find \(bookI.genre)")
//                        return
//                    }
//                    let book = Book(name: bookI.name, genre: genre)
//                    modelContext.insert(book)
//                    try? modelContext.save()
//                    // append the authors
//                    bookI.authorIds.forEach { authorFullName in
//                        guard let author = authors.first(where: {$0.fullName == authorFullName}) else {
//                            print("🇨🇦 Could not find \(authorFullName)")
//                            return
//                        }
//                        book.authors?.append(author)
//                        do {
//                            try modelContext.save()
//                            print("added \(author.fullName) to \(book.name)")
//                        } catch {
//                            print("failed to add \(author.fullName) to \(book.name)")
//                        }
//                       
//                    }
//                    
////                    try? modelContext.save()
//                }
//            }
//        }
    }
    
}

#Preview(traits: .mockData) {
    StartTabView()
}
