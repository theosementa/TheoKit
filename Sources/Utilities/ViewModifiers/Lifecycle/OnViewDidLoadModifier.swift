//
//  OnViewDidLoadModifier.swift
//  TheoKit
//
//  Created by Theo Sementa on 16/06/2025.
//

import Foundation
import SwiftUI

struct OnViewDidLoadModifier: ViewModifier {
    
    let action: () async -> Void
    
    @State private var hasLoaded = false
    
    func body(content: Content) -> some View {
        content
            .task {
                if !hasLoaded {
                    hasLoaded = true
                    await action()
                }
            }
    }
}

extension View {
    
    public func onViewDidLoad(_ action: @escaping () async -> Void) -> some View {
        return modifier(OnViewDidLoadModifier(action: action))
    }
    
}
