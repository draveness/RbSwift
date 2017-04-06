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
    ///     [1, 2, 3].select { $0 > 2 }         #=> [3]
    ///     [1, 2, 3].select { $0 <= 2 }        #=> [1, 2]
    ///     [1, 2, 3].select { _ in false }     #=> []
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
    ///     [1, 2, 3].keepIf { $0 > 2 }         #=> [3]
    ///     [1, 2, 3].keepIf { $0 <= 2 }        #=> [1, 2]
    ///     [1, 2, 3].keepIf { _ in false }     #=> []
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func keepIf(closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        return select(closure: closure)
    }
    
    /// Returns a new array excluding all elements of `self` for which the given block returns a true value.
    ///
    ///     [1, 2, 3].reject { $0 > 2 }         #=> [1, 2]
    ///     [1, 2, 3].reject { $0 <= 2 }        #=> [3]
    ///     [1, 2, 3].reject { _ in false }     #=> [1, 2, 3]
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
    
    /// An alias to reject, see also `Sequence#reject(closure:)`
    ///
    ///     [1, 2, 3].deleteIf { $0 > 2 }         #=> [1, 2]
    ///     [1, 2, 3].deleteIf { $0 <= 2 }        #=> [3]
    ///     [1, 2, 3].deleteIf { _ in false }     #=> [1, 2, 3]
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func deleteIf(_ closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        return reject(closure: closure)
    }
    
    /// Drops elements up to, but not including, the first element for which the 
    /// block returns nil or false and returns an array containing the remaining elements.
    ///
    ///     [1, 2, 3].dropWhile { $0 > 2 }         #=> [1, 2, 3]
    ///     [1, 2, 3].dropWhile { $0 <= 2 }        #=> [3]
    ///     [1, 2, 3].dropWhile { _ in false }     #=> [1, 2, 3]
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func dropWhile(_ closure: @escaping (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var drop = true
        return flatMap { item in
            drop = drop && closure(item)
            return drop ? nil : item
        }
    }
    
    /// Passes elements to the block until the block returns nil or false, then stops 
    /// iterating and returns an array of all prior elements.
    ///
    ///     [1, 2, 3].takeWhile { $0 > 2 }         #=> []
    ///     [1, 2, 3].takeWhile { $0 <= 2 }        #=> [1, 2]
    ///     [1, 2, 3].takeWhile { _ in false }     #=> []
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A new array
    func takeWhile(_ closure: @escaping (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var take = true
        return flatMap { item in
            take = take && closure(item)
            return take ? item : nil
        }
    }
    
    /// Invokes the given block once for each element of self.
    /// Creates a new array containing the values returned by the block.
    ///
    ///     [1, 2, 3].collect { _ in "2" }              #=> ["2", "2", "2"]
    ///     [1, 2, 3].collect { $0 * 2 }                #=> [2, 4, 6]
    ///     ["1", "2", "3"].collect { $0 + "!" }        #=> ["1!", "2!", "3!"]
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
    
    /// Returns a new array with the elements of both arrays within it.
    ///
    ///     let a = [1, 2, 3]
    ///     a.concat([4, 5, 6])     #=> [1, 2, 3, 4, 5, 6]
    ///     a                       #=> [1, 2, 3]
    ///     a.concat(7, 8, 9)       #=> [1, 2, 3, 7, 8, 9]
    ///     a                       #=> [1, 2, 3]
    ///
    /// - Parameter other: Another array
    /// - Returns: A new array contains all the element in both array
    func concat(_ other: [Iterator.Element]) -> [Iterator.Element] {
        return self + other
    }
    
    /// Returns a new array with the elements of both arrays within it.
    ///
    ///     let a = [1, 2, 3]
    ///     a.concat([4, 5, 6])     #=> [1, 2, 3, 4, 5, 6]
    ///     a                       #=> [1, 2, 3]
    ///     a.concat(7, 8, 9)       #=> [1, 2, 3, 7, 8, 9]
    ///     a                       #=> [1, 2, 3]
    ///
    /// - Parameter other: Another array
    /// - Returns: A new array contains all the element in both array
    func concat(_ others: Iterator.Element...) -> [Iterator.Element] {
        return self.concat(others)
    }
    
    /// Counts the number of elements for which the block returns a true value.
    ///
    ///     let a = [1, 2, 3, 10, 100, 1000]
    ///     a.count { $0 > 10 }             #=> 2
    ///     a.count { $0.isPositive }       #=> 6
    ///     expect(a.count { $0.isEven }    #=> 4
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
    
    /// Returns the first n elements of an array
    ///
    ///     let arr = [1, 2, 3, 4]
    ///     arr.take(1)         #=> [1]
    ///     arr.take(2)         #=> [1, 2]
    ///     arr.take(100)       #=> [1, 2, 3, 4]
    ///
    /// Returns an empty array if `num` is not positive
    ///
    ///     arr.take(0)         #=> []
    ///     arr.take(-1)        #=> []
    ///
    /// - Parameter num: An integer specifies the element of the returning array
    /// - Returns: An new array of first n elements
    func take(_ num: Int) -> [Iterator.Element] {
        guard num.isPositive else { return [] }
        guard num < self.count else { return Array<Iterator.Element>(self) }
        var results: [Iterator.Element] = []
        num.times { index in
            results.append(self.to_a[index])
        }
        return results
    }
    
    /// `drop` does the opposite of `take`, by returning the elements after n elements have been dropped.
    ///
    ///     let arr = [1, 2, 3, 4]
    ///     arr.drop(1)         #=> [2, 3, 4]
    ///     arr.drop(2)         #=> [3, 4]
    ///     arr.drop(100)       #=> []
    ///
    /// Returns an new array with the same element if `num` is not positive.
    ///
    ///     arr.take(0)         #=> [1, 2, 3, 4]
    ///     arr.take(-1)        #=> [1, 2, 3, 4]
    ///
    /// - Parameter num: How many element should be dropped from the beginning
    /// - Returns: An new array with first n elements dropped
    func drop(_ num: Int) -> [Iterator.Element] {
        guard num.isPositive else { return Array<Iterator.Element>(self) }
        guard num < self.count else { return [] }
        var results: [Iterator.Element] = []
        (self.count - num).times { index in
            results.append(self.to_a[index + num])
        }
        return results
    }
    
    /// Return the first n elements of an array. An alias to `Sequence#take(num:)` method.
    ///
    ///     let arr = [1, 2, 3, 4]
    ///     arr.first(1)        #=> [1]
    ///     arr.first(2)        #=> [1, 2]
    ///     arr.first(100)      #=> [1, 2, 3, 4]
    ///     arr.first(0)        #=> []
    ///     arr.first(-1)       #=> []
    ///
    /// - Parameter num: An integer specifies the element of the returning array
    /// - Returns: An new array of first n elements
    /// - See Also: `Sequence#take(num:)`
    func first(_ num: Int) -> [Iterator.Element] {
        return take(num)
    }
    
    /// Return the last n elements of an array.
    ///
    ///     let arr = [1, 2, 3, 4]
    ///     arr.last(1)        #=> [4]
    ///     arr.last(2)        #=> [3, 4]
    ///     arr.last(100)      #=> [1, 2, 3, 4]
    ///     arr.last(0)        #=> []
    ///     arr.last(-1)       #=> []
    ///
    /// - Parameter num: An integer specifies the element of the returning array
    /// - Returns: An new array of last n elements
    func last(_ num: Int) -> [Iterator.Element] {
        var result = Array<Iterator.Element>(self)
        guard num.isPositive else { return [] }
        guard num < self.length else { return result }
        result.removeFirst(self.length - num)
        return result
    }
    
    /// Calls the given block for each element n times.
    ///
    ///     let arr = [1, 2, 3, 4]
    ///     arr.cycle(2)        #=> [1, 2, 3, 4, 1, 2, 3, 4]
    ///
    ///     arr.cycle(10) { elem in
    ///         print(elem)     #=> 1, 2, 3, 4, 1, 2, 3, 4...
    ///     }
    ///
    /// - Parameters:
    ///   - n: An integer that indicates how many times the element in array should be called
    ///   - closure: A closure that accepts the element in array as parameter
    /// - Returns: An new array with every elements in array repeated for n times
    @discardableResult func cycle(_ n: Int = 1, closure: ((Iterator.Element) -> Void)? = nil) -> [Iterator.Element] {
        guard n.isPositive else { return [] }
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
    ///
    ///     let arr = [1, 2, 3, nil, 4, nil]
    ///     arr.compact         #=> [1, 2, 3, 4]
    ///     arr                 #=> [1, 2, 3, nil, 4, nil]
    ///
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
