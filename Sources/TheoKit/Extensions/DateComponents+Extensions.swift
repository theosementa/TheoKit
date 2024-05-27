//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

extension DateComponents {
    
    public func toDate() -> Date? {
        return Calendar.current.date(from: self)
    }
    
}
