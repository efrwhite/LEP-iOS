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

let backgroundMint = Color(red: 232/255, green: 245/255, blue: 238/255)
let darkGreen      = Color(red: 17/255,  green: 91/255,  blue: 59/255)
let lightGreen     = Color(red: 84/255,  green: 175/255, blue: 136/255)
let mutedGreen     = Color(red: 130/255, green: 169/255, blue: 152/255)
let primaryGreen   = Color(red: 46/255,  green: 125/255, blue: 91/255)
let teal           = Color(red: 47/255,  green: 128/255, blue: 128/255)
let offWhite       = Color(red: 248/255, green: 250/255, blue: 249/255)
let gray           = Color(red: 179/255, green: 179/255, blue: 179/255)
let orange         = Color(red: 233/255, green: 162/255, blue: 59/255)
let darkOrange     = Color(red: 200/255, green: 133/255, blue: 31/255)
let red            = Color(red: 192/255, green: 68/255,  blue: 58/255)
let brandOrange    = Color(red: 216/255, green: 90/255,  blue: 48/255)
