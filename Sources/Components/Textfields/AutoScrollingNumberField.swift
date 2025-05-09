//
//  AutoScrollingNumberField.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 06/05/2025.
//

import SwiftUI

public struct AutoScrollingNumberField<T: Numeric & LosslessStringConvertible>: View {
    
    // builder
    let placeholder: String
    @Binding var number: T
    let id: AnyHashable
    let reader: ScrollViewProxy
    
    @State private var text: String = ""
    
    // init
    public init(_ placeholder: String, number: Binding<T>, id: AnyHashable, reader: ScrollViewProxy) {
        self.placeholder = placeholder
        self._number = number
        self.id = id
        self.reader = reader
        
        if number.wrappedValue != 0 {
            self._text = State(initialValue: String(number.wrappedValue))
        }
    }
    
    // Conversion en fonction du type exact
    private func convertToNumber(_ text: String) -> T {
        return T(text) ?? T(0)
    }
    
    public var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { isFocused in
            if isFocused {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        reader.scrollTo(id, anchor: .center)
                    }
                }
            } else {
                // Mettre à jour la valeur numérique lors de la perte de focus
                updateNumberValue()
            }
        })
        .onChange(of: text) { newValue in
            updateNumberValue()
        }
        .id(id)
        .textFieldStyle(HideableTextField())
    }
    
    private func updateNumberValue() {
        number = convertToNumber(text)
    }
}
