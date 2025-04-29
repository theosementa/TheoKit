//
//  FullWidthModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import SwiftUI

struct FullWidthModifier: ViewModifier {
    
    var alignment: Alignment = .center
    
    init(alignment: Alignment) {
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}

extension View {
    public func fullWidth(_ alignment: Alignment = .center) -> some View {
        return modifier(FullWidthModifier(alignment: alignment))
    }
}
