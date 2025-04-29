//
//  AutoDeinitModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import SwiftUI

struct AutoDeinitModifier: ViewModifier {
    @FocusState private var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .autocorrectionDisabled(!isFocused)
    }
}

extension TextField {
    public func autoDeinitOnUnfocus() -> some View {
        modifier(AutoDeinitModifier())
    }
}
