//
// Created for MyBooks
// by  Stewart Lynch on 2023-10-15
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

extension Color {

    init?(hex: String) {
        guard let uiColor = UIColor(hex: hex) else { return nil }
        self.init(uiColor: uiColor)
    }

    func toHexString(includeAlpha: Bool = false) -> String? {
        return UIColor(self).toHexString(includeAlpha: includeAlpha)
    }
    
    func luminance() -> Double {
        // Convert SwiftUI Color to UIColor
        let uiColor = UIColor(self)
        // Extract RGB values
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        // Compute luminance.
        return 0.2126 * Double(red) + 0.7152 * Double(green) + 0.0722 * Double(blue)
    }
    func isLight() -> Bool {
        return luminance() > 0.5
    }
    func adaptedTextColor() -> Color {
        return isLight() ? Color.black : Color.white
    }
    
    func withShadeEquivalentToOpacity(_ targetOpacity: CGFloat) -> Color {
        let uiColor = UIColor(self)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            // Calculate the equivalent shade by reducing the intensity of each component
            let adjustedRed = red * (1 - targetOpacity) + targetOpacity
            let adjustedGreen = green * (1 - targetOpacity) + targetOpacity
            let adjustedBlue = blue * (1 - targetOpacity) + targetOpacity
            return Color(uiColor: UIColor(red: adjustedRed, green: adjustedGreen, blue: adjustedBlue, alpha: alpha))
        }

}
