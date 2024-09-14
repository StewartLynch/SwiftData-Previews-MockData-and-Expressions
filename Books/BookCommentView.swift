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

