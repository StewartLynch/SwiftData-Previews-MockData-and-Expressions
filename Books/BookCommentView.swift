//
//  BookDetailView.swift
//  Books
//
//  Created by Stewart Lynch on 9/12/24.
//

import SwiftUI
import SwiftData

struct BookCommentView: View {
    @Bindable var book: Book
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
            Text(book.name)
                .font(.title)
            Text(book.allAuthors)
                .font(.title3)
            Text(book.genre.name)
                .tagStyle(genre: book.genre)
            TextField("Comment", text: $book.comment, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    BookCommentView(book: )
//}

