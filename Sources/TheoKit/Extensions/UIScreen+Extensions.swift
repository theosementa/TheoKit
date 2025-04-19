//
//  UIScreen+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

#if canImport(UIKit)

import Foundation
import UIKit

extension UIScreen {
    public var displayCornerRadius: CGFloat {
        guard let cornerRadius = self.value(forKey:"_displayCornerRadius") as? CGFloat else {
            return 0
        }
        return cornerRadius
    }
}

#endif

