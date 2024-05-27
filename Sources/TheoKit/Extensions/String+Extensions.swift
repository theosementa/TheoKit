//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func toDouble() -> Double? {
        let stringFormated = self.replacingOccurrences(of: ",", with: ".")
        return Double(stringFormated)
    }
}
