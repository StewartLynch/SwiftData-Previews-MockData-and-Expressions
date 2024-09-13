//
//  Author.swift
//  Books
//
//  Created by Stewart Lynch on 9/8/24.
//

import SwiftUI
import SwiftData

@Model
class Author {
    var firstName: String
    var lastName: String
    var books: [Book] = []
    
    var fullName: String {
        (firstName + " " + lastName).trimmingCharacters(in: .whitespaces)
    }
    
//    init(firstName: String, lastName: String, books: [Author]) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.books = books
//    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
