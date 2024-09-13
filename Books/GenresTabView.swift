//
//  GenresTabView.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

struct GenresTabView: View {
    @Query(sort: \Genre.name) var genres: [Genre]
    var body: some View {
        NavigationStack {
            List(genres) { genre in
                HStack {
                    Text(genre.name)
                        .foregroundStyle(genre.textColor)
                    Spacer()
                    Text(genre.books.count, format: .number)
                }
                .listRowBackground(genre.colorStyle)
            }
            .navigationTitle("Genres")
        }
    }
}

#Preview(traits: .mockData) {
    GenresTabView()
}
