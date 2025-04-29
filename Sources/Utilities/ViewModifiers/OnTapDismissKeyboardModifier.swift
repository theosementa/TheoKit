//
//  OnTapDismissKeyboardModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//

import SwiftUI

struct OnTapDismissKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter { $0.activationState == .foregroundActive }
                        .map { $0 as? UIWindowScene }
                        .compactMap { $0 }
                        .first?.windows
                        .filter { $0.isKeyWindow }.first
                keyWindow?.endEditing(true)
        }
    }
}

extension View {
    
    public func onTapDismissKeyboard() -> some View {
        return modifier(OnTapDismissKeyboardModifier())
    }
    
}
