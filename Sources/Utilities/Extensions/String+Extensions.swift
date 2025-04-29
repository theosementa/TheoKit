//
//  String+Extensions.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 28/04/2025.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func toDouble() -> Double {
        let newVariable = NumberFormatter()
        newVariable.numberStyle = .decimal
        newVariable.locale = Locale.current
        return newVariable.number(from: self) as? Double ?? 0
    }
    
    func toDate() -> Date? {
        let dateIsoFormatter = ISO8601DateFormatter()
        dateIsoFormatter.formatOptions = [.withInternetDateTime]
        return dateIsoFormatter.date(from: self)
    }
    
#if canImport(UIKit)
    func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
#endif
}
