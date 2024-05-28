//
//  File.swift
//  
//
//  Created by KaayZenn on 28/05/2024.
//

import SwiftUI

struct SemiCustomSheetView<SheetContent: View>: View {
    
    // Builder
    @Binding var isPresented: Bool
    var height: CGFloat?
    var content: SheetContent
    
    // init
    public init(isPresented: Binding<Bool>, height: CGFloat? = nil, content: SheetContent) {
        self._isPresented = isPresented
        self.height = height
        self.content = content
    }
    
    // MARK: -
    var body: some View {
        if isPresented {
            VStack {
                HStack{
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
                Spacer()
                
                content
                
                Spacer()
            }
            .padding(24)
            .padding(.vertical, 8)
            .frame(height: height ?? 400)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .systemBackground))
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
