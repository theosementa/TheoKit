//
//  KeyboardHandler.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 29/04/2025.
//
//  Start from : https://github.com/michaelhenry/KeyboardAvoider/tree/master

#if os(iOS)

import Combine
import SwiftUI

class KeyboardHandler: ObservableObject {
    
    @Published private(set) var keyboardHeight: CGFloat = 0
    @Published private(set) var isKeyboardVisible: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var spaceBetweenKeyboardAndInputField: CGFloat
    
    init(spaceBetweenKeyboardAndInputField: CGFloat) {
        self.spaceBetweenKeyboardAndInputField = spaceBetweenKeyboardAndInputField
        setupKeyboardObservers()
    }
    
    private func setupKeyboardObservers() {
        let keyboardWillShow = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { notification -> CGFloat? in
                guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                    return nil
                }
                return keyboardFrame.height
            }
        
        let keyboardWillHide = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
        
        let keyboardDidShow = NotificationCenter.default
            .publisher(for: UIResponder.keyboardDidShowNotification)
            .compactMap { notification -> CGFloat? in
                guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                    return nil
                }
                return keyboardFrame.height
            }
        
        keyboardWillShow
            .receive(on: RunLoop.main)
            .sink { [weak self] height in
                guard let self = self else { return }
                
                self.keyboardHeight = height
                self.isKeyboardVisible = height > 0
                
                if height > 0 {
                    self.adjustActiveFieldVisibility()
                }
            }
            .store(in: &cancellables)
        
        keyboardWillHide
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                guard isKeyboardVisible else { return }
                
                withAnimation {
                    self.keyboardHeight = 0
                    self.isKeyboardVisible = false
                }
            }
            .store(in: &cancellables)
        
        keyboardDidShow
            .receive(on: RunLoop.main)
            .sink { [weak self] height in
                guard let self = self else { return }
                
                self.adjustActiveFieldVisibility()
                self.isKeyboardVisible = true
            }
            .store(in: &cancellables)
    }
    
    private func adjustActiveFieldVisibility() {
        guard keyboardHeight > 0,
              let activeView = findActiveTextInputView(),
              let scrollView = findScrollView(containing: activeView)
        else { return }
        
        let targetFrame = activeView.convert(activeView.bounds, to: nil)
        let targetY = targetFrame.maxY
        let containerY = UIScreen.main.bounds.height - keyboardHeight
        
        if containerY < targetY {
            DispatchQueue.main.async {
                let targetFrame = activeView.convert(activeView.bounds, to: scrollView)
                var visibleRect = targetFrame
                visibleRect.size.height += self.spaceBetweenKeyboardAndInputField
                scrollView.scrollRectToVisible(visibleRect, animated: true)
            }
        }
    }
    
    private func findActiveTextInputView() -> UIView? {
        if let textField = UIResponder.current() as? UITextField {
            return textField
        } else if let textView = UIResponder.current() as? UITextView {
            return textView
        }
        return nil
    }
    
    private func findScrollView(containing view: UIView) -> UIScrollView? {
        var current: UIView? = view
        while let currentView = current {
            if let scrollView = currentView as? UIScrollView {
                return scrollView
            }
            current = currentView.superview
        }
        return nil
    }
}

#endif
