//
//  DateComponents+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

public extension DateComponents {
    
    func toDate() -> Date? {
        return Calendar.current.date(from: self)
    }
    
}
