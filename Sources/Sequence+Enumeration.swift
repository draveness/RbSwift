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
    ///     [1, 2, 3].each { elem in
    ///         print(elem)     #=> 1, 2, 3
    ///     }
    ///
    /// - Parameter closure: An closure will passed to forEach method
    /// - Returns: Self
    @discardableResult func each(_ closure: (Iterator.Element) -> Void) -> Self {
        forEach(closure)
        return self
    }
    
    /// Iterate the receiver arrays with index which produced by a `for...in` and
    /// `enumerated` loop.
    ///
    ///     [1, 2, 3].eachWithIndex { (index, elem) in
    ///         // do something with index and elem
    ///     }
    ///
    /// - Parameter closure: A closure which accepts a index and an element
    /// - Returns: Self
    @discardableResult func eachWithIndex(_ closure: (Int, Iterator.Element) -> Void) -> Self {
        for (index, item) in self.enumerated() {
            closure(index, item)
        }
        return self
    }
    
    /// Iterate the receiver arrays with index which produced by a `for...in` and
    /// `enumerated` loop. Returns a new array which map from the receiver array's values
    /// to a new one.
    ///
    ///     let array = [1, 2, 3].mapWithIndex { (index, elem) in
    ///         return index + elem
    ///     }
    ///
    ///     array       #=> [1, 3, 5]
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
    ///     [1, 2, 3].reverseEach { elem in
    ///         print(elem)     #=> 3, 2, 1
    ///     }
    ///
    /// - Parameter closure: A closure will eventually passed to forEach method
    /// - Returns: Self
    @discardableResult func reverseEach(_ closure: (Iterator.Element) -> Void) -> Self {
        self.reversed().each(closure)
        return self
    }
}
