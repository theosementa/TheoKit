//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
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
