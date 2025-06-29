//
//  Searchable.swift
//  TheoKit
//
//  Created by Theo Sementa on 29/06/2025.
//

import Foundation

public protocol Searchable {
    var searchableText: String { get }
}

public extension Array where Element: Searchable {

    func search(_ text: String) -> [Element] {
        if text.isEmpty {
            return self
        } else {
            return self
                .filter { $0.searchableText.localizedStandardContains(text) }
        }
    }

}
