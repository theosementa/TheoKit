//
//  File.swift
//  TheoKit
//
//  Created by Theo Sementa on 09/05/2025.
//

import Foundation

extension Numeric where Self: LosslessStringConvertible {
    init(_ v: Int) {
        self.init(String(v))!
    }
}
