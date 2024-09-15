//
//----------------------------------------------
// Original project: Books
// by  Stewart Lynch on 2024-09-14
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import Foundation

struct ImportModel: Codable {
    struct GenreI: Codable {
        let name: String
        let color: String
    }
    
    struct AuthorI: Codable {
        let firstName: String
        let lastName: String
        let authorId: String
    }
    
    struct BookI: Codable {
        let name: String
        let genre: String
        let authorIds: [String]
    }
    
    let genres: [GenreI]
    let authors: [AuthorI]
    let books: [BookI]
    
    static func fetchMockData() -> ImportModel? {
        guard let url = Bundle.main.url(forResource: "MockData.json", withExtension: "") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        let importData = try? JSONDecoder().decode(ImportModel.self, from: data)
        return importData
    }
}
