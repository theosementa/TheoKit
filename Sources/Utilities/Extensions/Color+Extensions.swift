//
//  Color+Extensions.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 28/04/2025.
//

import SwiftUI

public extension Color {
    
    init(hex: String) {
        let cleanHex = hex
            .replacingOccurrences(of: "#", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        var int: UInt64 = 0
        Scanner(string: cleanHex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch cleanHex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 17) & 0xFF, (int >> 4 * 17) & 0xFF, int * 17 & 0xFF)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            opacity: CGFloat(a) / 255
        )
    }
    
    func toHex() -> String {
        guard let components = UIColor(self).cgColor.components else { return "" }
        
        let r: CGFloat = components[0]
        let g: CGFloat = components[1]
        let b: CGFloat = components[2]
        let a: CGFloat = components.count >= 4 ? components[3] : 1.0
        
        let hexR = String(format: "%02lX", Int(r * 255))
        let hexG = String(format: "%02lX", Int(g * 255))
        let hexB = String(format: "%02lX", Int(b * 255))
        let hexA = a < 1.0 ? String(format: "%02lX", Int(a * 255)) : ""
        
        return "\(hexR)\(hexG)\(hexB)\(hexA)"
    }
    
    static var label: Color {
        return Color(uiColor: UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor(Color.white) : UIColor(Color.black)
        })
    }
    
    static var labelInverse: Color {
        return Color(uiColor: UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor(Color.black) : UIColor(Color.white)
        })
    }
    
    func brightness(_ value: CGFloat) -> Color {
        adjust(brightness: value)
    }
    
    func adjust(
        hue: CGFloat = 0,
        saturation: CGFloat = 0,
        brightness: CGFloat = 0,
        opacity: CGFloat = 1
    ) -> Color {
        let color = UIColor(self)
        var currentHue: CGFloat = 0
        var currentSaturation: CGFloat = 0
        var currentBrigthness: CGFloat = 0
        var currentOpacity: CGFloat = 0

        if color.getHue(
            &currentHue,
            saturation: &currentSaturation,
            brightness: &currentBrigthness,
            alpha: &currentOpacity
        ) {
            return Color(
                hue: currentHue + hue,
                saturation: currentSaturation + saturation,
                brightness: currentBrigthness + brightness,
                opacity: currentOpacity + opacity
            )
        }
        return self
    }
    
    
}

public extension Color {
    
    struct HSL {
        var h: Double
        var s: Double
        var l: Double
    }
    
    func adjustLightness(percent: Double) -> Color {
        let hex = self.toHex()
        
        let hsl = hexToHSL(hex)
        let newLightness = min(1, max(0, hsl.l + percent / 100))
        let newHex = hslToHex(hsl.h, hsl.s, newLightness)
        return Color(hex: newHex)
    }

    private func hexToHSL(_ hex: String) -> HSL {
        let r = Double(Int(hex.prefix(2), radix: 16)!) / 255.0
        let g = Double(Int(hex[hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)], radix: 16)!) / 255.0
        let b = Double(Int(hex[hex.index(hex.startIndex, offsetBy: 4)..<hex.index(hex.startIndex, offsetBy: 6)], radix: 16)!) / 255.0
        
        let max = Swift.max(r, g, b)
        let min = Swift.min(r, g, b)
        var h: Double = 0
        var s: Double = 0
        let l = (max + min) / 2
        
        if max != min {
            let d = max - min
            s = l > 0.5 ? d / (2.0 - max - min) : d / (max + min)
            
            switch max {
            case r: h = (g - b) / d + (g < b ? 6 : 0)
            case g: h = (b - r) / d + 2
            case b: h = (r - g) / d + 4
            default: break
            }
            h /= 6
        }
        
        return HSL(h: h * 360, s: s, l: l)
    }

    private func hueToRGB(_ p: Double, _ q: Double, _ t: Double) -> Double {
        var t = t
        if t < 0 { t += 1 }
        if t > 1 { t -= 1 }
        if t < 1/6 { return p + (q - p) * 6 * t }
        if t < 1/2 { return q }
        if t < 2/3 { return p + (q - p) * (2/3 - t) * 6 }
        return p
    }

    private func hslToHex(_ h: Double, _ s: Double, _ l: Double) -> String {
        var r, g, b: Double
        
        if s == 0 {
            r = l
            g = l
            b = l
        } else {
            let q = l < 0.5 ? l * (1 + s) : l + s - l * s
            let p = 2 * l - q
            
            r = hueToRGB(p, q, h / 360 + 1/3)
            g = hueToRGB(p, q, h / 360)
            b = hueToRGB(p, q, h / 360 - 1/3)
        }
        
        func toHex(_ x: Double) -> String {
            let hex = String(format: "%02X", Int(round(x * 255)))
            return hex
        }
        
        return toHex(r) + toHex(g) + toHex(b)
    }

}
