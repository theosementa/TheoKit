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
