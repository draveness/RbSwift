//
//  Array+Equtable.swift
//  RbSwift
//
//  Created by draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Equatable
public extension Array where Element: Equatable {
    /// Returns a new array with unique element.
    var uniq: [Element] {
        var result: [Element] = []
        self.each {
            if !result.contains($0) { result.append($0) }
        }
        return result
    }
}

public extension Array where Element: Any {
    static func ==<T>(lhs: [[T]], rhs: [[T]]) -> Bool {
        guard lhs.count == rhs.count else { return false }
         lhs.zip(rhs)
        return true
    }
}
