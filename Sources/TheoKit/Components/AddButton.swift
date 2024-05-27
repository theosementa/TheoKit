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
    var icon: String?
    var foregroundColor: Color?
    var backgroundColor: Color?
    var action: () -> Void
    
    // MARK: -
    public var body: some View {
        Button(action: {
            action()
            VibrationManager.shared.doVibration()
        }, label: {
            Circle()
                .fill(backgroundColor.isNotNil() ? backgroundColor! : Color(uiColor: .label))
                .frame(width: 58, height: 58)
                .overlay {
                    Image(systemName: icon.isNotNil() ? icon! : "plus")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                        .foregroundStyle(foregroundColor.isNotNil() ? foregroundColor! : Color(uiColor: .systemBackground))
                }
        })
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    AddButton(action: {})
}

