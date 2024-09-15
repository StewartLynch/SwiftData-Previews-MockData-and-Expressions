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

struct AuthorsTabView: View {
    @Query(sort: \Author.lastName) var authors: [Author]
    var body: some View {
        NavigationStack {
            List(authors) { author in
                HStack {
                    Text(author.fullName)
                    Spacer()
                    Text("^[\(author.books.count) book](inflect: true)")
                }
            }
            .navigationTitle("Authors")
        }
    }
}

#Preview(traits: .mockData) {
    AuthorsTabView()
}
