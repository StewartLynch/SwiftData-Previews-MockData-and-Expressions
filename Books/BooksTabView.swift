//
//----------------------------------------------
// Original project:
// by  Stewart Lynch on 9/14/24
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

struct BooksTabView: View {
    @Query(sort: \Book.name) var books: [Book]
    @State private var selectedBook: Book?
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Books")
        }
    }
}

#Preview(traits: .mockData) {
    BooksTabView()
}
