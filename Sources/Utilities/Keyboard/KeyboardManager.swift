//
//  KeyboardManager.swift
//  TheoKit
//
//  Created by Theo Sementa on 09/05/2025.
//

import Foundation
import Combine
import SwiftUI

class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var isKeyboardVisible = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self,
                      let userInfo = notification.userInfo,
                      let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                else { return }
                
                self.isKeyboardVisible = true
                self.keyboardHeight = keyboardFrame.height
            }
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                withAnimation(.easeOut(duration: 0.3)) {
                    self.isKeyboardVisible = false
                    self.keyboardHeight = 0
                }
            }
            .store(in: &cancellables)
    }
}
