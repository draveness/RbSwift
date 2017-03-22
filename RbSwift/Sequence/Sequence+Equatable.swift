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
    /// - Parameter element: An element
    /// - Returns: A index indicates the first element position in the array of nil
    func index(_ element: Iterator.Element) -> Int? {
        for (index, elem) in self.enumerated() {
            if elem == element {
                return index
            }
        }
        return nil
    }
    
    /// Returns the index of the last object in self == to obj.
    ///
    /// - Parameter element: An element
    /// - Returns: A index indicates the last element position in the array of nil
    func rindex(_ element: Iterator.Element) -> Int? {
        var result: Int? = nil
        for (index, elem) in self.enumerated() {
            if elem == element {
                result = index
            }
        }
        return result
    }
}
