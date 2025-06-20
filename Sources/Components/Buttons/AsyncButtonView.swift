//
//  AsyncButtonView.swift
//  TheoKit
//
//  Created by Theo Sementa on 20/06/2025.
//

import SwiftUI

public struct AsyncButtonView<Label: View>: View {
    
    // MARK: Dependencies
    var role: ButtonRole?
    var action: () async -> Void
    var label: () -> Label
    
    public init(role: ButtonRole? = nil, action: @escaping () async -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.role = role
        self.action = action
        self.label = label
    }
    
    // MARK: - View
    public var body: some View {
        Button(role: role) {
            Task {
                await action()
            }
        } label: {
            label()
        }
    }
}

// MARK: - Preview
#Preview {
    AsyncButtonView(role: .destructive) {
        
    } label: {
        Text("Async Button")
    }
}
