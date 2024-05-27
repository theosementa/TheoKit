//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

extension Date {
    
    func toDateComponents() -> DateComponents {
        let comps = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
        return comps
    }
    
}
