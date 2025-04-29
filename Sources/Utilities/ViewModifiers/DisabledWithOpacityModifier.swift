//
//  DisabledWithOpacityModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 28/04/2025.
//

import SwiftUI

struct DisabledWithOpacityModifier: ViewModifier {
    
    var isDisabled: Bool
    
    init(_ isDisabled: Bool) {
        self.isDisabled = isDisabled
    }
    
    func body(content: Content) -> some View {
        content
            .disabled(isDisabled)
            .if(isDisabled) { $0.colorMultiply(Color(UIColor.gray)) }
            .animation(.smooth, value: isDisabled)
    }
}

extension View {
    
    public func disabledWithOpacity(_ isDisabled: Bool) -> some View {
        return modifier(DisabledWithOpacityModifier(isDisabled))
    }
    
}
