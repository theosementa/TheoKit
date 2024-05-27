//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
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

