//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

#if canImport(UIKit)

import Foundation
import UIKit

public class VibrationManager {
    public static let shared = VibrationManager()

    public func doVibration() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

}

#endif
