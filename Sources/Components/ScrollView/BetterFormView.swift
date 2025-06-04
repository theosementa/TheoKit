//
//  BetterFormView.swift
//  TheoKit
//
//  Created by Theo Sementa on 04/06/2025.
//

import SwiftUI

public struct BetterFormView<Content: View>: View {
    
    // MARK: Inputs
    let content: (ScrollViewProxy) -> Content
    
    // MARK: State
    @StateObject private var keyboard: KeyboardManager = .init()
    
    // MARK: Config
    private let scrollIndicators: ScrollIndicatorVisibility
    private let scrollBehavior: ScrollDismissesKeyboardMode
    
    // MARK: Init
    public init(
        scrollIndicators: ScrollIndicatorVisibility = .hidden,
        scrollBehavior: ScrollDismissesKeyboardMode = .interactively,
        @ViewBuilder content: @escaping (ScrollViewProxy) -> Content
    ) {
        self.content = content
        self.scrollIndicators = scrollIndicators
        self.scrollBehavior = scrollBehavior
    }

    // MARK: - View
    public var body: some View {
        ZStack(alignment: .top) {
            ScrollViewReader { proxy in
                ScrollView {
                    content(proxy)

                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: keyboard.isKeyboardVisible ? keyboard.keyboardHeight : 0)
                }
                .scrollIndicators(scrollIndicators)
                .scrollDismissesKeyboard(scrollBehavior)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
