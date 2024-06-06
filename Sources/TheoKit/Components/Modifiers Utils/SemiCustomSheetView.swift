//
//  File.swift
//  
//
//  Created by KaayZenn on 28/05/2024.
//

import SwiftUI

public struct SemiCustomSheetView<SheetContent: View>: View {
    
    // Builder
    @Binding var isPresented: Bool
    var height: CGFloat?
    var withDismissButton: Bool?
    var content: SheetContent
    
    // init
    public init(isPresented: Binding<Bool>, height: CGFloat? = nil, withDismissButton: Bool? = true, content: SheetContent) {
        self._isPresented = isPresented
        self.height = height
        self.withDismissButton = withDismissButton
        self.content = content
    }
    
    // MARK: -
    public var body: some View {
        if isPresented {
            VStack {
                if let withDismissButton, withDismissButton {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.smooth) {
                                isPresented = false
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(Color(uiColor: .label))
                                .padding(6)
                                .background {
                                    Circle()
                                        .foregroundStyle(Color(uiColor: .systemGray4))
                                }
                        })
                    }
                }
                
                content
            }
            .padding(24)
            .padding(.vertical, 8)
            .frame(height: height ?? nil)
            .frame(maxWidth: .infinity)
            .background(Color.Apple.backgroundSheet)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.displayCornerRadius, style: .continuous))
            .padding(4)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    VStack {
        Text("Hello")
            .semiCustomSheet(isPresented: .constant(true)) {
                Text("Hello World !")
            }
    }
}
