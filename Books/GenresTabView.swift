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

struct GenresTabView: View {
    @Query(sort: \Genre.name) var genres: [Genre]
    var body: some View {
        NavigationStack {
            List(genres) { genre in
                HStack {
                    Text(genre.name)
                    Spacer()
                    Text("^[\(genre.books.count) book](inflect: true)")
                }
                .listRowBackground(genre.colorStyle)
                .foregroundStyle(genre.textColor)
            }
            .navigationTitle("Genres")
        }
    }
}

#Preview(traits: .mockData) {
    GenresTabView()
}
