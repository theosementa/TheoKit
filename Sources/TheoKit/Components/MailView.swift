//
//  File.swift
//
//
//  Created by KaayZenn on 27/05/2024.
//

#if canImport(UIKit)

import SwiftUI
import UIKit
import MessageUI

public struct MailView: UIViewControllerRepresentable {
    
    // Builder
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    var recipients: [String]?
    var subject: String?
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(
            presentation: presentation,
            result: $result
        )
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(recipients)
        if let subject {
            vc.setSubject(subject)
        }
        return vc
    }
    
    public func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: UIViewControllerRepresentableContext<MailView>) { }
    
    // Coordinator
    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        // Builder
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        // init
        public init(
            presentation: Binding<PresentationMode>,
            result: Binding<Result<MFMailComposeResult, Error>?>
        ) {
            _presentation = presentation
            _result = result
        }
        
        public func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
}

#endif
