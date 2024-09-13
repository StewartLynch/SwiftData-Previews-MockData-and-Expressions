//
//  ContentView.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

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

#Preview {
    StartTabView()
}
