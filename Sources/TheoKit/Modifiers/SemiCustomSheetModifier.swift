//
//  File.swift
//  
//
//  Created by KaayZenn on 28/05/2024.
//

import Foundation
import SwiftUI

public struct SemiCustomSheetModifier<SheetContent: View>: ViewModifier {
    
    // Builder
    @Binding var isPresented: Bool
    var height: CGFloat?
    var withDismissButton: Bool?
    var borderSpacing: CGFloat?
    var sheetContent: () -> SheetContent
    
    public init(isPresented: Binding<Bool>, height: CGFloat? = nil, withDismissButton: Bool? = true, borderSpacing: CGFloat? = nil, sheetContent: @escaping () -> SheetContent) {
        self._isPresented = isPresented
        self.height = height
        self.withDismissButton = withDismissButton
        self.borderSpacing = borderSpacing
        self.sheetContent = sheetContent
    }
    
    // MARK: -
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .disabled(isPresented)
            .overlay(alignment: .bottom) {
                ZStack(alignment: .bottom, content: {
                    if isPresented {
                        Color.black
                            .opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    isPresented = false
                                }
                            }
                    }
                    
                    if isPresented {
                        SemiCustomSheetView(isPresented: $isPresented, height: height, withDismissButton: withDismissButton, borderSpacing: borderSpacing, content: sheetContent())
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut(duration: 0.3), value: isPresented)
                            .ignoresSafeArea()
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }
    } // End body
} // End struct

// MARK: - View Extension
extension View {
    public func semiCustomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        height: CGFloat? = nil,
        withDismissButton: Bool? = true,
        borderSpacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        modifier(
            SemiCustomSheetModifier(
                isPresented: isPresented,
                height: height,
                withDismissButton: withDismissButton,
                borderSpacing: borderSpacing,
                sheetContent: content
            )
        )
    }
}
