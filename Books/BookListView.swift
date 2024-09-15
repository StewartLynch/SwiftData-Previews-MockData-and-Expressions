//
//----------------------------------------------
// Original project: Books
// by  Stewart Lynch on 2024-09-15
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [Book]
    @State private var selectedBook: Book?
    init(sortOrder: SortOrder, filterType: FilterType, filter: String) {
        let sortDescriptors: [SortDescriptor<Book>] =
        switch sortOrder {
            case .book:
                [SortDescriptor(\Book.name)]
            case .genre:
                [SortDescriptor(\Book.genre.name)]
        }
        var predicate: Predicate<Book>
        if filter.isEmpty {
            predicate = #Predicate { book in true}
        } else {
            switch filterType {
                case .book:
                    predicate = #Predicate<Book> { book in
                        book.name.localizedStandardContains(filter)
                    }
                case .genre:
                    predicate = #Predicate<Book> { book in
                        book.genre.name.localizedStandardContains(filter)
                    }
                case .author:
                    let foundAuthorsCount = #Expression<[Author], Int> { authors in
                        authors.filter { $0.firstName.localizedStandardContains(filter) ||
                            $0.lastName.localizedStandardContains(filter)
                        }.count
                    }
                    predicate = #Predicate<Book> { book in
                        book.authors.count > 0 &&
                        foundAuthorsCount.evaluate(book.authors) > 0
                    }
            }
        }
        _books = Query(filter: predicate, sort: sortDescriptors)
    }
    var body: some View {
        List(books) { book in
            VStack(alignment: .leading) {
                HStack {
                    Text(book.name)
                        .font(.title)
                    Spacer()
                    Text(book.genre.name)
                        .tagStyle(genre: book.genre)
                }
                HStack {
                    Text(book.allAuthors)
                    Spacer()
                    Button {
                        selectedBook = book
                    } label: {
                        Image(systemName: "message")
                            .symbolVariant(book.comment.isEmpty ? .none : .fill)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .listStyle(.plain)
        .sheet(item: $selectedBook) { book in
            BookCommentView(book: book)
                .presentationDetents([.height(300)])
        }
    }
}

#Preview(traits: .mockData) {
    let sortOrder = SortOrder.book
    let filterType = FilterType.book
    let filter = ""
    BookListView(
        sortOrder: sortOrder,
        filterType: filterType,
        filter: filter
    )
}
