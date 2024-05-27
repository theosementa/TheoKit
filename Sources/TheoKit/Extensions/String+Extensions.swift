//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func toDouble() -> Double? {
        let stringFormated = self.replacingOccurrences(of: ",", with: ".")
        return Double(stringFormated)
    }
    
    #if canImport(UIKit)
    public func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    #endif
}
