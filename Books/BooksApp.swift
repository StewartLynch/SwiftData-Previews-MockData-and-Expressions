//
//  BooksApp.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

@main
struct BooksApp: App {
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .modelContainer(for: Book.self)
        }
    }
}
