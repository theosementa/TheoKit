//
//  File.swift
//  TheoKit
//
//  Created by Theo Sementa on 29/06/2025.
//

import SwiftUI

struct TextFieldAreaTappableViewModifier: ViewModifier {
    
    // MARK: States
    @FocusState private var isFocused: Bool
    
    // MARK: - View
    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .onTapGesture { isFocused = true }
    }
}

// MARK: - View Extension
extension View {
    public func areaTappable() -> some View {
        return modifier(TextFieldAreaTappableViewModifier())
    }
}
