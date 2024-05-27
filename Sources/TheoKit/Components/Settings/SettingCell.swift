//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation
import SwiftUI

public struct SettingCell: View {
    
    // Builder
    public var icon: String
    public var backgroundColor: Color
    public var text: String
    public var textColor: Color = Color.label
    public var isPush: Bool
    public var action: () -> Void
    
    // init
    public init(icon: String, backgroundColor: Color, text: String, textColor: Color = Color.label, isPush: Bool, action: @escaping () -> Void) {
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.text = text
        self.textColor = textColor
        self.isPush = isPush
        self.action = action
    }
        
    // MARK: -
    public var body: some View {
        Button(action: action, label: {
            HStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(backgroundColor)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: icon)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .padding(.trailing, 4)
                
                Text(text)
                    .foregroundStyle(textColor)
                
                Spacer()
                
                Image(systemName: isPush ? "chevron.right" : "arrow.up.right")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 12, weight: .semibold))
            }
        })
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    Form {
        SettingCell(
            icon: "person.fill",
            backgroundColor: .red,
            text: "Preview 1",
            isPush: false,
            action: {}
        )
        SettingCell(
            icon: "sun.max",
            backgroundColor: .blue,
            text: "Preview 2",
            isPush: true,
            action: {}
        )
    }
}
