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
    
    var localizedPackage: String {
        return NSLocalizedString(self, bundle: .module, comment: "")
    }
    
    public func toDouble() -> Double? {
        let stringFormated = self.replacingOccurrences(of: ",", with: ".")
        return Double(stringFormated)
    }
    
    public func isEmptyWithoutSpace() -> Bool {
        if self.replacingOccurrences(of: " ", with: "").isEmpty {
            return true
        } else { 
            return false
        }
    }
    
    #if canImport(UIKit)
    public func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    #endif
}
