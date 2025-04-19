//
//  Bundle+Extensions.swift
//  TheoKit
//
//  Created by Theo Sementa on 19/04/2025.
//

import Foundation

extension Bundle {
    
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
}
