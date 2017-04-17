//
//  Sequence+Equatable.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Equatable
public extension Sequence where Iterator.Element: Equatable {
    /// Returns the index of the first object in ary such that the object is == to obj.
    ///
    ///     [1, 2, 3].index(1)              #=> 0
    ///     [1, 2, 3].index(2)              #=> 1
    ///     [1, 2, 3, 3, 4].index(3)        #=> 2
    ///
    /// - Parameter element: An element
    /// - Returns: A index indicates the first element position in the array of nil
    func index(_ element: Self.Iterator.Element) -> Int? {
        for (index, elem) in self.enumerated() {
            if elem == element {
                return index
            }
        }
        return nil
    }
    
    /// Returns the index of the last object in self == to obj.
    ///
    ///     [1, 2, 3].rindex(1)              #=> 0
    ///     [1, 2, 3].rindex(2)              #=> 1
    ///     [1, 2, 3, 3, 4].rindex(3)        #=> 3
    ///
    /// - Parameter element: An element
    /// - Returns: A index indicates the last element position in the array of nil
    func rindex(_ element: Self.Iterator.Element) -> Int? {
        var result: Int? = nil
        for (index, elem) in self.enumerated() {
            if elem == element {
                result = index
            }
        }
        return result
    }
}
