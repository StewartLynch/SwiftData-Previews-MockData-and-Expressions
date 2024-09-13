//
//  Book.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

@Model
class Book {
    var name: String
    var genre: Genre
    var comment: String = ""
    @Relationship(inverse: \Author.books)
    var authors: [Author] = []
    
    var allAuthors: String {
            return authors.map { $0.fullName}.joined(separator: ", ")
    }
    
    init(name: String, genre: Genre ) {
        self.name = name
        self.genre = genre
    }
}

