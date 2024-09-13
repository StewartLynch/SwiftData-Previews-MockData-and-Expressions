//
//  AuthorsTabView.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

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
