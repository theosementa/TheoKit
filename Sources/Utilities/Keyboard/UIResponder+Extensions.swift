//
//  Static.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import UIKit

extension UIResponder {
    
    private struct Static { static weak var responder: UIResponder? }
    
    static func current() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func trap() {
        Static.responder = self
    }
}
