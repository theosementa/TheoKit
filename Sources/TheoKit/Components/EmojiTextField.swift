//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation
import SwiftUI

public class UIEmojiTextField: UITextField {

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setEmoji() {
        _ = self.textInputMode
    }
    
    public override var textInputContextIdentifier: String? {
           return ""
    }
    
    public override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                self.keyboardType = .default
                return mode
            }
        }
        return nil
    }
}

// MARK: -
/// No placeholder, text = "🔥" to create a placeholder that a real emoji
public struct EmojiTextField: UIViewRepresentable {
    
    // Builder
    @Binding var text: String
    var alignment: NSTextAlignment?
    var fontSize: CGFloat?
    
    public init(text: Binding<String>, alignment: NSTextAlignment? = nil, fontSize: CGFloat? = nil) {
        self._text = text
        self.alignment = alignment
        self.fontSize = fontSize
    }
    
    public func makeUIView(context: Context) -> UIEmojiTextField {
        let emojiTextField = UIEmojiTextField()
        emojiTextField.text = text
        emojiTextField.delegate = context.coordinator
        emojiTextField.textAlignment = alignment ?? .center
        emojiTextField.font = .systemFont(ofSize: fontSize ?? 20)
        return emojiTextField
    }
    
    public func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
        uiView.text = text
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

// MARK: -
public class Coordinator: NSObject, UITextFieldDelegate {
    var parent: EmojiTextField
    
    init(parent: EmojiTextField) {
        self.parent = parent
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.last {
            if char.isEmoji && (parent.text.last != char || parent.text.isEmpty) {
                self.parent.text = String(char)
                return true
            }
        }
        
        return false
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
