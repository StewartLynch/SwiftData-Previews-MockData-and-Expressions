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

@Model
class Author {
    #Unique<Author>([\.firstName, \.lastName])
    var firstName: String
    var lastName: String
    var books: [Book]
    
    var fullName: String {
        (firstName + " " + lastName).trimmingCharacters(in: .whitespaces)
    }
    
    init(firstName: String, lastName: String, books: [Book]) {
        self.firstName = firstName
        self.lastName = lastName
        self.books = books
    }
    
    convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, lastName: lastName, books: [])
    }
}
