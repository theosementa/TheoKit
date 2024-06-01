//
//  File.swift
//  
//
//  Created by KaayZenn on 01/06/2024.
//

import Foundation

extension Double {
    
    public func formatWith(num: Int) -> String {
        return String(format: "%.\(num)f", self)
    }
    
}
