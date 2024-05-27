//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

extension Character {
    /// A simple emoji is one scalar and presented to the user as an Emoji
    public var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else { return false }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }

    /// Checks if the scalars will be merged into an emoji
    public var isCombinedIntoEmoji: Bool {
        self.unicodeScalars.count > 1 && self.unicodeScalars.first?.properties.isEmoji ?? false
    }

    public var isEmoji: Bool {
        return isSimpleEmoji || isCombinedIntoEmoji
    }
}
