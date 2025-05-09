//
//  ListWithBluredHeader.swift
//  TheoKit
//
//  Created by Theo Sementa on 09/05/2025.
//

import SwiftUI

struct ListWithBluredHeader<Header: View, Content: View>: View {

    // MARK: Dependencies
    let header: Header
    let content: Content
    
    // MARK: State
    @State private var headerHeight: CGFloat = 0
    @State private var alreadyCalculatedHeaderHeight: Bool = false
    
    // MARK: Config
    private let maxBlurRadius: CGFloat
    
    // MARK: Environment
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    // MARK: init
    init(
        maxBlurRadius: CGFloat = 10,
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content
    ) {
        self.maxBlurRadius = maxBlurRadius
        self.header = header()
        self.content = content()
    }
    
    // MARK: - View
    var body: some View {
        ZStack(alignment: .top) {
            List {
                Color.clear
                    .noDefaultStyle()
                    .frame(height: headerHeight)
                
                content
            }
            .listStyle(.plain)
                        
            header
                .frame(height: headerHeight != 0 ? headerHeight + safeAreaInsets.top : nil, alignment: .bottom)
                .background(VariableBlurView(maxBlurRadius: maxBlurRadius, direction: .blurredTopClearBottom))
                .getSize { size in
                    if !alreadyCalculatedHeaderHeight {
                        self.headerHeight = size.height
                        self.alreadyCalculatedHeaderHeight = true
                    }
                }
                .ignoresSafeArea(edges: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
