//
//  RoudedRectangleBorderViewModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import SwiftUI

struct RoudedRectangleBorderViewModifier: ViewModifier {
    
    var color: Color
    var radius: CGFloat
    var lineWidth: CGFloat? = nil
    var strokeColor: Color? = nil
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .fill(color)
                    .overlay {
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .stroke(strokeColor ?? Color.clear, lineWidth: lineWidth ?? 0)
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
    
}

extension View {
    
    public func roundedRectangleBorder(
        _ color: Color,
        radius: CGFloat,
        lineWidth: CGFloat? = nil,
        strokeColor: Color? = nil
    ) -> some View {
        return modifier(
            RoudedRectangleBorderViewModifier(
                color: color,
                radius: radius,
                lineWidth: lineWidth,
                strokeColor: strokeColor
            )
        )
    }
    
}
