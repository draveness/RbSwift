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
    /// - Returns: An empty string
    @discardableResult mutating func clear() -> [Element] {
        self = []
        return self
    }
    
    /// Remove last element in array or nil
    ///
    /// - Returns: The last element in array
    mutating func pop() -> Element? {
        return self.popLast()
    }
    
    /// Return the last several elements in array.
    ///
    /// - Parameter num: The count of returning elements
    /// - Returns: An new array of popped element
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
    
    /// Remove first element in array or nil
    ///
    /// - Returns: The first element in array
    mutating func shift() -> Element? {
        if self.isEmpty { return nil }
        return self.removeFirst()
    }
    
    /// Return the first several elements in array.
    ///
    /// - Parameter num: The count of returning elements
    /// - Returns: An new array of shifted element
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
}

// MARK: - Mutate
public extension Array where Element: Equatable {
    /// Deletes all items from self that are equal to obj.
    /// If all is `false`, delete the first object the the array.
    ///
    /// - Parameters:
    ///   - obj: An object which will be deleted in the array
    ///   - all: A bool value indicates whether deletes all the same object in array (default is `true`).
    /// - Returns: The deleted object or nil.
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
