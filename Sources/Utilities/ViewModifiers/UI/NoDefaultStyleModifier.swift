//
//  NoDefaultStyleModifier.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 28/04/2025.
//

import SwiftUI

struct NoDefaultStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

extension View {
    
    /// Applies a custom style to list rows by hiding separators, setting a clear background, and removing default insets.
    ///
    /// Use this modifier to standardize the appearance of list rows across your app, removing the default SwiftUI list styling.
    ///
    /// ```swift
    /// List {
    ///     ForEach(items) { item in
    ///         Text(item.name)
    ///     }
    ///     .noDefaultStyle()
    /// }
    /// ```
    public func noDefaultStyle() -> some View {
        modifier(NoDefaultStyleModifier())
    }
    
}
