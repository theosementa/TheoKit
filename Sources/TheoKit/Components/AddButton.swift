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
    public var iconWeight: Font.Weight?
    public var foregroundColor: Color?
    public var backgroundColor: Color?
    public var width: CGFloat?
    public var action: () -> Void
    
    // init
    public init(
        icon: String? = nil,
        iconSize: CGFloat? = nil,
        iconWeight: Font.Weight? = nil,
        foregroundColor: Color? = nil,
        backgroundColor: Color? = nil,
        width: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.iconSize = iconSize
        self.iconWeight = iconWeight
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.width = width
        self.action = action
    }
    
    // MARK: -
    public var body: some View {
        Button(action: {
            action()
            VibrationManager.shared.doVibration()
        }, label: {
            Circle()
                .fill(backgroundColor ?? Color.label)
                .frame(width: width ?? 58, height: width ?? 58)
                .overlay {
                    Image(systemName: icon ?? "plus")
                        .font(.system(size: iconSize ?? 20, weight: iconWeight ?? .semibold, design: .rounded))
                        .foregroundStyle(foregroundColor ?? Color(uiColor: .systemBackground))
                }
        })
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    AddButton(action: {})
}

