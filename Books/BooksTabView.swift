//
//  BooksTabView.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI

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
            HStack {
                Picker("Sort Order", selection: $sortOrder) {
                    ForEach(SortOrder.allCases) { sortOrder in
                        Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
                Picker("Filter Type", selection: $filterType) {
                    ForEach(FilterType.allCases) { filterType in
                        Text("Filter by \(filterType.rawValue)").tag(filterType)
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            BookList(
                sortOrder: sortOrder,
                filterType: filterType,
                filter: filter
            )
            .searchable(text: $filter, prompt: Text("Enter search criteria"))
            .navigationTitle("Books")
        }
    }
}

#Preview(traits: .mockData) {
    BooksTabView()
}
