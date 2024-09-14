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

struct TagStyle: ViewModifier{
    let genre: Genre
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(genre.textColor)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5).fill(genre.colorStyle))
    }
}
extension View {
    func tagStyle(genre: Genre) -> some View {
        modifier(TagStyle(genre: genre))
    }
}
