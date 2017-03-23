//
//  Sequence+Patch.swift
//  SwiftPatch
//
//  Created by Draveness on 17/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Transform
public extension Sequence {
    /// Returns a new array containing all elements of `self` for which the given block returns a true value.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func select(closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var result: [Iterator.Element] = []
        for item in self {
            if closure(item) {
                result.append(item)
            }
        }
        return result
    }
    
    /// An alias to `select(closure:)` method.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func keep(if closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        return select(closure: closure)
    }
    
    /// Returns a new array excluding all elements of `self` for which the given block returns a true value.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func reject(closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var result: [Iterator.Element] = []
        for item in self {
            if !closure(item) {
                result.append(item)
            }
        }
        return result
    }
    
    /// Invokes the given block once for each element of self.
    /// Creates a new array containing the values returned by the block.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a value
    /// - Returns: A new array
    func collect<T>(closure: (Iterator.Element) -> T) -> [T] {
        var result: [T] = []
        for item in self {
            result.append(closure(item))
        }
        return result
    }
    
    /// Passes each element of the collection to the given block. The method returns
    /// `true` if the block ever returns a value other than false.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates there is an element cause the block to return true
    func isAny(closure: (Iterator.Element) -> Bool) -> Bool {
        return reduce(false) { (result, element) in
            return result || closure(element)
        }
    }
    
    /// Passes each element of the collection to the given block.
    /// The method returns true if the block never returns false.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates all the elements in array cause the block to return true
    func isAll(closure: (Iterator.Element) -> Bool) -> Bool {
        return reduce(true) { (result, element) in
            return result && closure(element)
        }
    }
    
    /// Returns a new array with the elements of both arrays within it.
    ///
    /// - Parameter other: Another array
    /// - Returns: A new array contains all the element in both array
    func concat(_ other: [Iterator.Element]) -> [Iterator.Element] {
        return self + other
    }
    
    /// Counts the number of elements for which the block returns a true value.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: An integer of the count of element make the block returns true
    func count(closure: (Iterator.Element) -> Bool) -> Int {
        return self.filter(closure).count
    }
    
    /// Returns a new array that is a one-dimensional flattening of self (recursively)
    ///
    /// - Returns: A new array that is a one-dimensional flattening of self
    func flatten<T>() -> [T] {
        var results = [T]()
        for element in self {
            if let seq = element as? [Iterator.Element] {
                results += seq.flatten()
            } else if let element = element as? T {
                results.append(element)
            }
        }
        return results
    }
    
    /// Return the first n elements of an array
    ///
    /// - Parameter num: An integer specifies the element of the returning array
    /// - Returns: An new array of first n elements
    func take(_ num: Int) -> [Iterator.Element] {
        guard num > 0 else { return [] }
        guard num < self.count else { return Array<Iterator.Element>(self) }
        var results: [Iterator.Element] = []
        num.times { index in
            results.append(self.to_a[index])
        }
        return results
    }
    
    /// `drop` does the opposite of `take`, by returning the elements after n elements have been dropped
    ///
    /// - Parameter num: How many element should be dropped from the beginning
    /// - Returns: An new array with first n elements dropped
    func drop(_ num: Int) -> [Iterator.Element] {
        guard num > 0 else { return Array<Iterator.Element>(self) }
        guard num < self.count else { return [] }
        var results: [Iterator.Element] = []
        (self.count - num).times { index in
            results.append(self.to_a[index + num])
        }
        return results
    }
    
    /// Return the first n elements of an array
    ///
    /// - Parameter num: An integer specifies the element of the returning array
    /// - Returns: An new array of first n elements
    func first(_ num: Int) -> [Iterator.Element] {
        return take(num)
    }
    
    /// Calls the given block for each element n times.
    ///
    /// - Parameters:
    ///   - n: An integer that indicates how many times the element in array should be called
    ///   - closure: A closure that accepts the element in array as parameter
    /// - Returns: An new array with every elements in array repeated for n times
    @discardableResult func cycle(_ n: Int = 1, closure: ((Iterator.Element) -> Void)? = nil) -> [Iterator.Element] {
        guard n > 0 else { return [] }
        let results = self.to_a * n
        if let closure = closure {
            results.forEach { closure($0) }
        }
        return results
    }
}

public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

public extension Sequence where Iterator.Element: OptionalType {
    /// Returns a copy of self with all nil elements removed.
    /// See: http://stackoverflow.com/questions/28190631/creating-an-extension-to-filter-nils-from-an-array-in-swift
    var compact: [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
}
