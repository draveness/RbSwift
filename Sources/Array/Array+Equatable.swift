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
    ///
    ///     let arr = [1, 2, 3, 4, 1, 2]
    ///     arr.uniq        #=> [1, 2, 3, 4]
    ///     arr             #=> [1, 2, 3, 4, 1, 2]
    ///
    var uniq: [Element] {
        var result: [Element] = []
        self.each {
            if !result.contains($0) { result.append($0) }
        }
        return result
    }
}
