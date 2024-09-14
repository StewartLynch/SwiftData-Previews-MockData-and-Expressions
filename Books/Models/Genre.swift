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
class Genre {
    @Attribute(.unique)
    var name: String
    var color: String
    @Relationship(inverse: \Book.genre)
    var books: [Book]
    
    // Computed property used to determine the foreground style for Genre tag
    var colorStyle: Color {
        Color(hex: color)!
    }
    var textColor: Color {
        colorStyle.adaptedTextColor()
    }
    
    init(name: String, color: String, books: [Book]) {
        self.name = name
        self.color = color
        self.books = books
    }
  
    convenience init(name: String, color: String) {
        self.init(name: name, color: color, books: [])
    }
    
}
