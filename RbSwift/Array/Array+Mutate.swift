//
//  Array+Mutate.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Mutate
public extension Array {
    /// Makes the current string empty
    ///
    ///     var arr = [1, 2, 3]
    ///     arr.clear()     #=> []
    ///     arr             #=> []
    ///
    /// - Returns: An empty string
    @discardableResult
    mutating func clear() -> [Element] {
        self = []
        return self
    }
    
    /// Remove last element in array or nil
    ///
    ///     var arr = [1, 2, 3]
    ///     arr.pop()       #=> 3
    ///     arr.pop()       #=> 2
    ///     arr.pop()       #=> 1
    ///     arr.pop()       #=> nil
    ///     arr             #=> []
    ///
    /// - Returns: The last element in array
    @discardableResult
    mutating func pop() -> Element? {
        return self.popLast()
    }
    
    /// Return the last several elements in array.
    ///
    ///     var arr = [1, 2, 3]
    ///     arr.pop()       #=> [3]
    ///     arr.pop(2)      #=> [1, 2]
    ///     arr             #=> []
    ///     arr.pop()       #=> []
    ///     arr.pop()       #=> []
    ///     arr             #=> []
    ///
    /// - Parameter num: The count of returning elements
    /// - Returns: An new array of popped element
    @discardableResult
    mutating func pop(_ num: Int) -> [Element] {
        guard num.isPositive else { return [] }
        guard num < self.length else {
            let element = self
            self.clear()
            return element
        }
        var result: [Element] = []
        for _ in 0..<num {
            result.append(pop()!)
        }
        return result.reversed()
    }
    
    /// Appends objects to the front of self.
    ///
    ///     var arr = ["a", "b", "c"]
    ///     arr.push("d")           #=> ["a", "b", "c", "d"]
    ///     arr.push("e", "f")      #=> ["a", "b", "c", "d", "e", "f"]
    ///     arr                     #=> ["a", "b", "c", "d", "e", "f"]
    ///
    /// - Parameter objs: An array of object prepend to the receiver array
    /// - Returns: An array with objs append to self
    /// - See also: Array#pop(num:) for the opposite effect.
    @discardableResult
    mutating func push(_ objs: Element...) -> [Element] {
        self += objs
        return self
    }
    
    /// Remove first element in array or nil
    ///
    ///     var arr = ["a", "b", "c"]
    ///     arr.shift()     #=> "a"
    ///     arr             #=> ["b", "c"]
    ///     arr.shift()     #=> "b"
    ///     arr.shift()     #=> "c"
    ///     arr.shift()     #=> nil
    ///     arr             #=> []
    ///
    /// - Returns: The first element in array
    @discardableResult
    mutating func shift() -> Element? {
        if self.isEmpty { return nil }
        return self.removeFirst()
    }
    
    /// Return the first several elements in array.
    ///
    ///     var arr = ["a", "b", "c"]
    ///     arr.shift()     #=> "a"
    ///     arr             #=> ["b", "c"]
    ///     arr.shift(2)     #=> ["b", "c"]
    ///     arr.shift()     #=> []
    ///     arr             #=> []
    ///
    /// - Parameter num: The count of returning elements
    /// - Returns: An new array of shifted element
    @discardableResult
    mutating func shift(_ num: Int) -> [Element] {
        guard num.isPositive else { return [] }
        guard num < self.length else {
            let element = self
            self.clear()
            return element
        }
        var result: [Element] = []
        for _ in 0..<num {
            result.append(shift()!)
        }
        return result
    }
    
    /// Prepends objects to the front of self, moving other elements upwards
    ///
    ///     var arr = [1]
    ///     arr.unshift(2)      #=> [2, 1]
    ///     arr.unshift(2, 3)   #=> [2, 3, 2, 1]
    ///     arr                 #=> [2, 3, 2, 1]
    ///
    /// - Parameter objs: An array of object prepend to the receiver array
    /// - Returns: An array with objs prepend to self
    /// - See also: Array#shift(num:) for the opposite effect.
    @discardableResult
    mutating func unshift(_ objs: Element...) -> [Element] {
        self = objs + self
        return self
    }
    
    /// A mutating version of `Sequence#select(closure:)`
    ///
    ///     var arr1 = [1, 2, 3]
    ///     arr1.select { $0 > 2 }       #=> [3]
    ///     arr1                         #=> [3]
    ///
    ///     var arr2 = [1, 2, 3]
    ///     arr2.select { $0 <= 2 }      #=> [1, 2]
    ///     arr2                         #=> [1, 2]
    ///
    ///     var arr3 = [1, 2, 3]
    ///     arr3.select { _ in false }   #=> []
    ///     arr3                         #=> []
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: Self
    @discardableResult
    mutating func selected(closure: (Element) throws -> Bool) rethrows -> [Element] {
        self = try select(closure)
        return self
    }
    
    /// A mutating version of `Sequence#reject(closure:)`
    ///
    ///     var arr1 = [1, 2, 3]
    ///     arr1.reject { $0 > 2 }       #=> [1, 2]
    ///     arr1                         #=> [1, 2]
    ///
    ///     var arr2 = [1, 2, 3]
    ///     arr2.reject { $0 <= 2 }      #=> [3]
    ///     arr2                         #=> [3]
    ///
    ///     var arr3 = [1, 2, 3]
    ///     arr3.reject { _ in false }   #=> [1, 2, 3]
    ///     arr3                         #=> [1, 2, 3]
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: Self
    @discardableResult
    mutating func rejected(closure: (Element) throws -> Bool)rethrows  -> [Element] {
        self = try reject(closure)
        return self
    }
}

// MARK: - Mutate
public extension Array where Element: Equatable {
    /// Deletes all items from self that are equal to obj.
    /// If all is `false`, delete the first object the the array.
    ///
    ///     var arr = [1, 2, 3, 4, 1, 2, 3, 5, 6]
    ///     arr.delete(1)                   #=> 1
    ///     arr                             #=> [2, 3, 4, 2, 3, 5, 6]
    ///     arr.delete(2)                   #=> 2
    ///     arr                             #=> [3, 4, 3, 5, 6]
    ///     arr.delete(3, all: false)       #=> 3
    ///     arr                             #=> [4, 3, 5, 6]
    ///     arr.delete(1000)                #=> nil
    ///     arr                             #=> [4, 3, 5, 6]
    ///
    /// - Parameters:
    ///   - obj: An object which will be deleted in the array
    ///   - all: A bool value indicates whether deletes all the same object in array (default is `true`).
    /// - Returns: The deleted object or nil.
    @discardableResult
    mutating func delete(_ obj: Element, all: Bool = true) -> Element? {
        var indexes: [Int] = []
        for (index, item) in self.enumerated() {
            if item == obj {
                indexes.append(index)
            }
        }
        
        guard indexes.count.isPositive else { return nil }
        
        if !all {
            indexes = [indexes.first!]
        }
        
        for index in indexes.reversed() {
            self.remove(at: index)
        }
        
        return obj
    }
}
