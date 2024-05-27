//
//  SwiftUIView.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import SwiftUI

public struct SettingFooter: View {
    
    // Builder
    public var author: String
    
    // init
    public init(author: String) {
        self.author = author
    }
    
    // MARK: -
    public var body: some View {
        VStack(spacing: 8) {
            Text("Made with ❤️ by **\(author)**")
            
            HStack(spacing: 24) {
                if let version = Bundle.main.releaseVersionNumber {
                    Text("v\(version)")
                }
                if let build = Bundle.main.buildVersionNumber {
                    Text(build)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.Apple.background.edgesIgnoringSafeArea(.all))
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    Form {
        SettingFooter(author: "Theo Sementa")
    }
}
