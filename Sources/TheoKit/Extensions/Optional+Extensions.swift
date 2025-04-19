//
//  Optional+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

extension Optional {
    
    public var isNil: Bool {
        return self == nil
    }
    
    public var isNotNil: Bool {
        return self != nil
    }
    
}
