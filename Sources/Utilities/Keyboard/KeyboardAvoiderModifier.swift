//
//  KeyboardAvoiderModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import SwiftUI
import Combine

struct KeyboardAvoiderModifier: ViewModifier {
    
    @StateObject private var keyboard: KeyboardHandler
    
    init(spaceBetweenKeyboardAndInputField: CGFloat) {
        self._keyboard = StateObject(wrappedValue: .init(spaceBetweenKeyboardAndInputField: spaceBetweenKeyboardAndInputField))
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboard.keyboardHeight)
    }
}

extension View {
    public func avoidKeyboard(spaceBetweenKeyboardAndInputField: CGFloat = 32) -> some View {
        modifier(KeyboardAvoiderModifier(spaceBetweenKeyboardAndInputField: spaceBetweenKeyboardAndInputField))
    }
}
