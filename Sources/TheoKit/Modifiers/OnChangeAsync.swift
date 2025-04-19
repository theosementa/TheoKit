//
//  OnChangeAsync.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import SwiftUICore

struct OnChangeAsync<Value: Equatable>: ViewModifier {
    let value: Value
    let action: (Value) async -> Void
    
    @State private var previousValue: Value
    
    init(value: Value, action: @escaping (Value) async -> Void) {
        self.value = value
        self.action = action
        self._previousValue = State(initialValue: value)
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: value) { newValue in
                Task {
                    await action(newValue)
                }
                previousValue = newValue
            }
    }
}

extension View {
    public func onChangeAsync<Value: Equatable>(of value: Value, perform action: @escaping (Value) async -> Void) -> some View {
        modifier(OnChangeAsync(value: value, action: action))
    }
}


