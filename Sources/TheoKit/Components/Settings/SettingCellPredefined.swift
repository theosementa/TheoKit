//
//  SwiftUIView.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import SwiftUI

public struct SettingCellPredefined: View {
    
    // Builder
    public var style: SettingCellStyle
    public var action: () -> Void
    
    // init
    public init(style: SettingCellStyle, action: @escaping () -> Void) {
        self.style = style
        self.action = action
    }
        
    // MARK: -
    public var body: some View {
        Button(action: action, label: {
            HStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(style.backgroundColor)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: style.icon)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .padding(.trailing, 4)
                
                Text(style.text)
                    .foregroundStyle(Color.label)
                
                Spacer()
                
                Image(systemName: style.isPush ? "chevron.right" : "arrow.up.right")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 12, weight: .semibold))
            }
        })
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    Form {
        SettingCellPredefined(style: .general, action: {})
        SettingCellPredefined(style: .review, action: {})
    }
}

public enum SettingCellStyle {
    case general
    case review
    case share
    case reportBug
    case suggestFeature
    case conditionOfUse
    case privacyPolicy
    case moreFromThisDev
    
    public var icon: String {
        switch self {
        case .general:
            return "gearshape.fill"
        case .review:
            return "star.fill"
        case .share:
            return "square.and.arrow.up.fill"
        case .reportBug:
            return "ladybug.fill"
        case .suggestFeature:
            return "sparkles"
        case .conditionOfUse:
            return "lock.fill"
        case .privacyPolicy:
            return "hand.raised.fill"
        case .moreFromThisDev:
            return "app.badge.checkmark.fill"
        }
    }
    
    public var backgroundColor: Color {
        switch self {
        case .general:
            return .gray
        case .review:
            return .orange
        case .share:
            return .blue
        case .reportBug:
            return .red
        case .suggestFeature:
            return .purple
        case .conditionOfUse:
            return .blue
        case .privacyPolicy:
            return .blue
        case .moreFromThisDev:
            return .blue
        }
    }
    
    public var text: String {
        switch self {
        case .general:
            return "word_general".localizedPackage
        case .review:
            return "word_review".localizedPackage
        case .share:
            return "word_share".localizedPackage
        case .reportBug:
            return "word_reportBug".localizedPackage
        case .suggestFeature:
            return "word_suggestFeature".localizedPackage
        case .conditionOfUse:
            return "word_conditions".localizedPackage
        case .privacyPolicy:
            return "word_privacy".localizedPackage
        case .moreFromThisDev:
            return "word_moreFromThisDev".localizedPackage
        }
    }
    
    public var isPush: Bool {
        switch self {
        case .general:
            return true
        case .review:
            return false
        case .share:
            return false
        case .reportBug:
            return false
        case .suggestFeature:
            return false
        case .conditionOfUse:
            return false
        case .privacyPolicy:
            return false
        case .moreFromThisDev:
            return false
        }
    }
    
}
