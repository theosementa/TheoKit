//
//  AutoScrollingTextField.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 05/05/2025.
//

import SwiftUI

public struct AutoScrollingTextField: View {
    
    let placeholder: String
    @Binding var text: String
    
    let id: AnyHashable
    let reader: ScrollViewProxy
    
    public init(_ placeholder: String, text: Binding<String>, id: AnyHashable, reader: ScrollViewProxy) {
        self.placeholder = placeholder
        self._text = text
        self.id = id
        self.reader = reader
    }
    
    public var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { isFocused in
            if isFocused {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        reader.scrollTo(id, anchor: .center)
                    }
                }
            }
        })
        .id(id)
        .textFieldStyle(HideableTextField())
    }
}
