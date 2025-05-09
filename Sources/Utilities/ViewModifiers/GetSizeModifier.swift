//
//  GetSizeModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 08/05/2025.
//

import SwiftUI

public struct GetSizeModifier: ViewModifier {
    
    var size: (_ size: CGSize) -> Void
    
    public func body(content: Content) -> some View {
        return content.background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        size(proxy.size)
                    }
            }
        )
    }
}

extension View {
    public func getSize(size: @escaping (CGSize) -> Void) -> some View {
        return modifier(GetSizeModifier(size: size))
    }
}
