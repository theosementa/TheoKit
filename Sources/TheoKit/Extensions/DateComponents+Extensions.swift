//
//  DateComponents+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

extension DateComponents {
    
    public func toDate() -> Date? {
        return Calendar.current.date(from: self)
    }
    
}
