//
//  File.swift
//  TheoKit
//
//  Created by Theo Sementa on 29/06/2025.
//

import SwiftUI

struct FullSizeViewModifier: ViewModifier {
 
    // MARK: Dependencies
    let alignment: Alignment
    
    // MARK: - View
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
}

// MARK: - View Extension
extension View {
    public func fullSize(alignment: Alignment = .center) -> some View {
        return modifier(FullSizeViewModifier(alignment: alignment))
    }
}
