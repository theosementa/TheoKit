//
//  String+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    public var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    public func toDouble() -> Double {
        let newVariable = NumberFormatter()
        newVariable.numberStyle = .decimal
        newVariable.locale = Locale.current
        return newVariable.number(from: self) as? Double ?? 0
    }
    
    #if canImport(UIKit)
    public func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    #endif
}
