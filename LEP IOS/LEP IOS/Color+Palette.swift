import SwiftUI

// MARK: - Color Palette
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    static let primaryGreen = Color(hex: "2E7D5B")
    static let bgMint       = Color(hex: "E8F5EE")
    static let tealSlate    = Color(hex: "2F8080")
    static let cardWhite    = Color(hex: "F8FAF9")
    static let sageBorder   = Color(hex: "82A998")
    static let vibrantMint  = Color(hex: "54AF88")
    static let deepPine     = Color(hex: "115B3B")
    static let neutralGray  = Color(hex: "B3B3B3")
    static let warmAmber    = Color(hex: "E8A33D")
    static let deepOchre    = Color(hex: "C7841F")
    static let brickRed     = Color(hex: "C1443C")
}
