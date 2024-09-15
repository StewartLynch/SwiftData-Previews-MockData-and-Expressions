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

struct StartTabView: View {
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
    }
}

#Preview(traits: .mockData) {
    StartTabView()
}
