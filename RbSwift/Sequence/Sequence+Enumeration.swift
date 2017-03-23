//
//  Sequence+Enumeration.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Enumeration
public extension Sequence {
    /// An alias to `Sequence#forEach(body:)`.
    ///
    /// - Parameter closure: An closure will passed to forEach method
    func each(_ closure: (Iterator.Element) -> Void) {
        forEach(closure)
    }
    
    /// Iterate the receiver arrays with index which produced by a `for...in` and
    /// `enumerated` loop.
    ///
    /// - Parameter closure: A closure which accepts a index and an element
    func eachWithIndex(_ closure: (Int, Iterator.Element) -> Void) {
        for (index, item) in self.enumerated() {
            closure(index, item)
        }
    }
    
    /// Iterate the receiver arrays with index which produced by a `for...in` and
    /// `enumerated` loop. Returns a new array which map from the receiver array's values
    /// to a new one.
    ///
    /// - Parameter closure: A closure which accepts a index and an element
    /// - Returns: An new array with mapped value
    func mapWithIndex<T>(_ closure: (Int, Iterator.Element) -> T) -> [T] {
        var results: [T] = []
        for (index, item) in self.enumerated() {
            results.append(closure(index, item))
        }
        return results
    }
    
    /// Invoke reversed first and call `Sequence#each(closure:)` methods on the receiver.
    ///
    /// - Parameter closure: A closure will eventually passed to forEach method
    func reverseEach(_ closure: (Iterator.Element) -> Void) {
        self.reversed().each(closure)
    }
}