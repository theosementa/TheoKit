//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation
import SwiftUI

public struct AddButton: View {
    
    // Builder
    public var icon: String?
    public var iconSize: CGFloat?
    public var foregroundColor: Color?
    public var backgroundColor: Color?
    public var action: () -> Void
    
    // init
    public init(icon: String? = nil, iconSize: CGFloat? = nil, foregroundColor: Color? = nil, backgroundColor: Color? = nil, action: @escaping () -> Void) {
        self.icon = icon
        self.iconSize = iconSize
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    // MARK: -
    public var body: some View {
        Button(action: {
            action()
            VibrationManager.shared.doVibration()
        }, label: {
            Circle()
                .fill(backgroundColor ?? Color(uiColor: .label))
                .frame(width: 58, height: 58)
                .overlay {
                    Image(systemName: icon ?? "plus")
                        .font(.system(size: iconSize ?? 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(foregroundColor ?? Color(uiColor: .systemBackground))
                }
        })
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    AddButton(action: {})
}

