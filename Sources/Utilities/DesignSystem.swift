//
//  File.swift
//  TheoKit
//
//  Created by Theo Sementa on 02/05/2025.
//

import Foundation
import SwiftUI

public struct TKDesignSystem {
    
    public static var fontRegular: String = ""
    public static var fontMedium: String = ""
    public static var fontBold: String = ""
    
    public struct Colors { }
    
}

// MARK: - Colors - Background
public extension TKDesignSystem.Colors {
    struct Background {
        public struct Dark {
            public static let bg50 = Color(hex: "#101010")
            public static let bg100 = Color(hex: "#1C1C1E")
            public static let bg200 = Color(hex: "#2C2C2E")
            public static let bg300 = Color(hex: "#3A3A3C")
            public static let bg400 = Color(hex: "#48484A")
            public static let bg500 = Color(hex: "#636366")
            public static let bg600 = Color(hex: "#8E8E93")
        }
        public struct Light {
            public static let bg50 = Color(hex: "#F2F2F7")
            public static let bg100 = Color(hex: "#FFFFFF")
            public static let bg200 = Color(hex: "#E5E5EA")
            public static let bg300 = Color(hex: "#D1D1D6")
            public static let bg400 = Color(hex: "#C7C7CC")
            public static let bg500 = Color(hex: "#A9A9AB")
            public static let bg600 = Color(hex: "#8E8E93")
        }
        public struct Theme {
            public static var bg50: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#101010")) : UIColor(Color(hex: "#F2F2F7"))
                })
            }
            public static var bg100: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#1C1C1E")) : UIColor(Color(hex: "#FFFFFF"))
                })
            }
            public static var bg200: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#2C2C2E")) : UIColor(Color(hex: "#E5E5EA"))
                })
            }
            public static var bg300: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#3A3A3C")) : UIColor(Color(hex: "#D1D1D6"))
                })
            }
            public static var bg400: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#48484A")) : UIColor(Color(hex: "#C7C7CC"))
                })
            }
            public static var bg500: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#636366")) : UIColor(Color(hex: "#A9A9AB"))
                })
            }
            public static var bg600: Color {
                return Color(uiColor: UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor(Color(hex: "#8E8E93")) : UIColor(Color(hex: "#8E8E93"))
                })
            }
        }
    }
}

public extension TKDesignSystem.Colors {
    struct Error {
        public static let c50 = Color(hex: "#fef2f2")
        public static let c100 = Color(hex: "#fee2e2")
        public static let c200 = Color(hex: "#fecaca")
        public static let c300 = Color(hex: "#fca5a5")
        public static let c400 = Color(hex: "#f87171")
        public static let c500 = Color(hex: "#ef4444")
        public static let c600 = Color(hex: "#dc2626")
        public static let c700 = Color(hex: "#b91c1c")
        public static let c800 = Color(hex: "#991b1b")
        public static let c900 = Color(hex: "#7f1d1d")
    }
    
    struct Warning {
        public static let c50 = Color(hex: "#fffbeb")
        public static let c100 = Color(hex: "#fef3c7")
        public static let c200 = Color(hex: "#fde68a")
        public static let c300 = Color(hex: "#fcd34d")
        public static let c400 = Color(hex: "#fbbf24")
        public static let c500 = Color(hex: "#f59e0b")
        public static let c600 = Color(hex: "#d97706")
        public static let c700 = Color(hex: "#b45309")
        public static let c800 = Color(hex: "#92400e")
        public static let c900 = Color(hex: "#78350f")
    }
    
    struct Success {
        public static let c50 = Color(hex: "#f0fdf4")
        public static let c100 = Color(hex: "#dcfce7")
        public static let c200 = Color(hex: "#bbf7d0")
        public static let c300 = Color(hex: "#86efac")
        public static let c400 = Color(hex: "#4ade80")
        public static let c500 = Color(hex: "#22c55e")
        public static let c600 = Color(hex: "#16a34a")
        public static let c700 = Color(hex: "#15803d")
        public static let c800 = Color(hex: "#166534")
        public static let c900 = Color(hex: "#14532d")
    }
    
    struct Info {
        public static let c50 = Color(hex: "#eff6ff")
        public static let c100 = Color(hex: "#dbeafe")
        public static let c200 = Color(hex: "#bfdbfe")
        public static let c300 = Color(hex: "#93c5fd")
        public static let c400 = Color(hex: "#60a5fa")
        public static let c500 = Color(hex: "#3b82f6")
        public static let c600 = Color(hex: "#2563eb")
        public static let c700 = Color(hex: "#1d4ed8")
        public static let c800 = Color(hex: "#1e40af")
        public static let c900 = Color(hex: "#1e3a8a")
    }
}

public extension TKDesignSystem {
    
    struct Fonts {
        public struct Display {
            /// `This font is in "Bold 40" style`
            public static let extraLarge: Font = Font.custom(TKDesignSystem.fontBold, size: 40)
            /// `This font is in "Bold 36" style`
            public static let large: Font = Font.custom(TKDesignSystem.fontBold, size: 36)
            /// `This font is in "Bold 32" style`
            public static let medium: Font = Font.custom(TKDesignSystem.fontBold, size: 32)
            /// `This font is in "Bold 28" style`
            public static let small: Font = Font.custom(TKDesignSystem.fontBold, size: 28)
        }
        public struct Title {
            /// `This font is in "Bold 24" style`
            public static let large: Font = Font.custom(TKDesignSystem.fontBold, size: 24)
            /// `This font is in "Medium 20" style`
            public static let medium: Font = Font.custom(TKDesignSystem.fontMedium, size: 20)
        }
        public struct Body {
            /// `This font is in "Bold 18" style`
            public static let large: Font = Font.custom(TKDesignSystem.fontBold, size: 18)
            /// `This font is in "Bold 16" style`
            public static let mediumBold: Font = Font.custom(TKDesignSystem.fontBold, size: 16)
            /// `This font is in "Medium 16" style`
            public static let medium: Font = Font.custom(TKDesignSystem.fontMedium, size: 16)
            /// `This font is in "Medium 14" style`
            public static let small: Font = Font.custom(TKDesignSystem.fontMedium, size: 14)
        }
        public struct Label {
            /// `This font is in "Medium 12" style`
            public static let large: Font = Font.custom(TKDesignSystem.fontMedium, size: 12)
            /// `This font is in "Bold 10" style`
            public static let medium: Font = Font.custom(TKDesignSystem.fontBold, size: 10)
            /// `This font is in "Bold 8" style`
            public static let small: Font = Font.custom(TKDesignSystem.fontBold, size: 8)
        }
    }
    
}


// MARK: - Numbers
public extension TKDesignSystem {
    
    struct Radius {
        /// `Value = 8`
        public static let small: CGFloat = 8
        /// `Value = 12`
        public static let medium: CGFloat = 12
        /// `Value = 16`
        public static let standard: CGFloat = 16
        /// `Value = 24`
        public static let large: CGFloat = 24
        /// `Value = 32`
        public static let extraLarge: CGFloat = 32
    }
    
    struct Padding {
        /// `Value = 4`
        public static let extraSmall: CGFloat = 4
        /// `Value = 8`
        public static let small: CGFloat = 8
        /// `Value = 12`
        public static let medium: CGFloat = 12
        /// `Value = 14`
        public static let regular: CGFloat = 14
        /// `Value = 16`
        public static let standard: CGFloat = 16
        /// `Value = 24`
        public static let large: CGFloat = 24
        /// `Value = 32`
        public static let extraLarge: CGFloat = 32
    }
    
    struct Spacing {
        /// `Value = 4`
        public static let extraSmall: CGFloat = 4
        /// `Value = 8`
        public static let small: CGFloat = 8
        /// `Value = 12`
        public static let medium: CGFloat = 12
        /// `Value = 16`
        public static let standard: CGFloat = 16
        /// `Value = 24`
        public static let large: CGFloat = 24
        /// `Value = 32`
        public static let extraLarge: CGFloat = 32
    }
    
}
