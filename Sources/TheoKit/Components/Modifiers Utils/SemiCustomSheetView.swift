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
    var borderSpacing: CGFloat?
    var content: SheetContent
    
    @State private var offset = CGFloat.zero
    @State private var dragOffset = CGFloat.zero
    @State private var contentHeight: CGFloat = 0
    
    // init
    public init(isPresented: Binding<Bool>, height: CGFloat? = nil, withDismissButton: Bool? = true, borderSpacing: CGFloat? = nil, content: SheetContent) {
        self._isPresented = isPresented
        self.height = height
        self.withDismissButton = withDismissButton
        self.borderSpacing = borderSpacing
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
                    .background(
                        GeometryReader { geometry -> Color in
                            DispatchQueue.main.async {
                                self.contentHeight = geometry.size.height
                            }
                            return Color.clear
                        }
                    )
            }
            .padding(24)
            .padding(.vertical, 8)
            .frame(height: height ?? nil)
            .frame(maxWidth: .infinity)
            .background(Color.Apple.backgroundSheet)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.displayCornerRadius, style: .continuous))
            .padding(borderSpacing ?? 4)
            .offset(y: offset + dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation.height
                    }
                    .onEnded { value in
                        if offset + dragOffset > contentHeight / 2 {
                            withAnimation(.smooth) {
                                isPresented = false
                            }
                        } else {
                            withAnimation(.smooth) {
                                dragOffset = .zero
                            }
                        }
                    }
            )
            .onAppear {
                offset = .zero
            }
        }
    } // End body
} // End struct


// MARK: - Preview
#Preview {
    VStack {
        Text("Hello")
            .semiCustomSheet(isPresented: .constant(true), withDismissButton: false) {
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
                Text("Hello World !")
            }
    }
}
