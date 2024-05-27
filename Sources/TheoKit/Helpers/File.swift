//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

#if canImport(UIKit)

import Foundation
import UIKit
import SwiftUI

private struct InteractiveDismissableView<T: View>: UIViewControllerRepresentable {
    let view: T
    let isDisabled: Bool
    let onAttemptToDismiss: (() -> Void)?
  
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: view)
    }
  
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {
        context.coordinator.dismissableView = self
        uiViewController.rootView = view
        uiViewController.parent?.presentationController?.delegate = context.coordinator
    }
  
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
  
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var dismissableView: InteractiveDismissableView
    
        init(_ dismissableView: InteractiveDismissableView) {
            self.dismissableView = dismissableView
        }
    
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            !dismissableView.isDisabled
        }
    
        func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
            dismissableView.onAttemptToDismiss?()
        }
    }
}

extension View {
    public func interactiveDismissDisabled(_ isDisabled: Bool = true, onAttemptToDismiss: (() -> Void)? = nil) -> some View {
        InteractiveDismissableView(view: self, isDisabled: isDisabled, onAttemptToDismiss: onAttemptToDismiss)
    }
}

#endif
