//
//  Double+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

public extension Double {
    
    func toString(maxDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = maxDigits
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
