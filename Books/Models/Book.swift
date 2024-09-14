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
class Book {
    #Index<Book>([\.name], [\.genre])
    var name: String
    var genre: Genre
    var comment: String = ""
    @Relationship(inverse: \Author.books)
    var authors: [Author]
    
    var allAuthors: String {
            return authors.map { $0.fullName}.joined(separator: ", ")
    }
    
    init(name: String, genre: Genre, authors: [Author]) {
        self.name = name
        self.genre = genre
        self.authors = authors
    }
    
    convenience init(name: String, genre: Genre) {
        self.init(name: name, genre: genre, authors: [])
    }
}

