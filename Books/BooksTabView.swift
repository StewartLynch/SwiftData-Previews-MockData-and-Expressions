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

enum SortOrder: String, Identifiable, CaseIterable {
    case book, genre
    var id: Self { self }
}

enum FilterType: String, Identifiable, CaseIterable {
    case book, genre, author
    var id: Self { self }
}
struct BooksTabView: View {
    @State private var sortOrder = SortOrder.book
    @State private var filterType = FilterType.book
    @State private var filter = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Picker("Sort Ordeer", selection: $sortOrder) {
                        ForEach(SortOrder.allCases) { sortOrder in
                            Text("Sort By \(sortOrder)")
                        }
                    }
                    Spacer()
                    Picker("Filter Type", selection: $filterType) {
                        ForEach(FilterType.allCases) { filterType in
                            Text("Filter by \(filterType)")
                        }
                    }
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
                BookListView(
                    sortOrder: sortOrder,
                    filterType: filterType,
                    filter: filter
                )
            }
            .searchable(text: $filter, prompt: "Enter search criteria")
            .navigationTitle("Books")
        }
    }
}

#Preview(traits: .mockData) {
    BooksTabView()
}
