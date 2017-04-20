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
    @discardableResult
    func each(_ closure: (Self.Iterator.Element) throws -> Void) rethrows -> Self {
        try forEach(closure)
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
    @discardableResult
    func eachWithIndex(_ closure: (Int, Self.Iterator.Element) throws -> Void) rethrows -> Self {
        for (index, item) in self.enumerated() {
            try closure(index, item)
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
    func mapWithIndex<T>(_ closure: (Int, Iterator.Element) throws -> T) rethrows -> [T] {
        var results: [T] = []
        for (index, item) in self.enumerated() {
            try results.append(closure(index, item))
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
    @discardableResult
    func reverseEach(_ closure: (Self.Iterator.Element) throws -> Void) rethrows -> Self {
        try self.reversed().each(closure)
        return self
    }
}

public extension Sequence {
    /// Returns a sequence of pairs (*n*, *x*), where *n* represents a
    /// consecutive integer starting at zero, and *x* represents an element of
    /// the sequence.
    ///
    /// This example enumerates the characters of the string "Swift" and prints
    /// each character along with its place in the string.
    ///
    ///     for (n, c) in "Swift".characters.withIndex {
    ///         print("\(n): '\(c)'")
    ///     }
    ///     // Prints "0: 'S'"
    ///     // Prints "1: 'w'"
    ///     // Prints "2: 'i'"
    ///     // Prints "3: 'f'"
    ///     // Prints "4: 't'"
    ///
    /// When enumerating a collection, the integer part of each pair is a counter
    /// for the enumeration, not necessarily the index of the paired value.
    /// These counters can only be used as indices in instances of zero-based,
    /// integer-indexed collections, such as `Array` and `ContiguousArray`. For
    /// other collections the counters may be out of range or of the wrong type
    /// to use as an index. To iterate over the elements of a collection with its
    /// indices, use the `zip(_:_:)` function.
    ///
    /// This example iterates over the indices and elements of a set, building a
    /// list of indices of names with five or fewer letters.
    ///
    ///     let names: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
    ///     var shorterIndices: [SetIndex<String>] = []
    ///     for (i, name) in zip(names.indices, names) {
    ///         if name.characters.count <= 5 {
    ///             shorterIndices.append(i)
    ///         }
    ///     }
    ///
    /// Now that the `shorterIndices` array holds the indices of the shorter
    /// names in the `names` set, you can use those indices to access elements in
    /// the set.
    ///
    ///     for i in shorterIndices {
    ///         print(names[i])
    ///     }
    ///     // Prints "Sofia"
    ///     // Prints "Mateo"
    ///
    /// - Returns: A sequence of pairs enumerating the sequence.
    var withIndex: EnumeratedSequence<Self> {
        return enumerated()
    }
}
