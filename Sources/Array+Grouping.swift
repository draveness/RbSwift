//
//  Array+Grouping.swift
//  RbSwift
//
//  Created by draveness on 15/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Grouping
public extension Array {
    /// Splits or iterates over the array in groups of size `number`,
    /// padding any remaining slots with `with` unless it is `nil`.
    ///
    /// 	arr.inGroup(of: 0)              #=> []
    /// 	arr.inGroup(of: 3)              #=> [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
    /// 	arr.inGroup(of: 4)              #=> [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10]]
    /// 	arr.inGroup(of: 4, fill: 0)     #=> [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 0, 0]]
    ///
    /// 	arr.inGroup(of: 4, fill: 0) { group in
    ///         print(group)    #=> [1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 0, 0]
    ///     }
    ///
    /// - Parameters:
    ///   - num: The size of array in the two dimentional array.
    ///   - with: An element used to padding remaining slot in the last array.
    ///   - closure: A closure recevies array as parameter
    /// - Returns: A two dimentional array of `Element`.
    @discardableResult
    func inGroup(of num: Int, fill with: Element? = nil, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
        guard num.isPositive else { return [] }
        var elements = self
        var slices: [[Element]] = []
        while !elements.isEmpty {
            var slice = elements.shift(num)
            if let with = with {
                while slice.count < num { slice.append(with) }
            }
            closure?(slice)
            slices.append(slice)
        }
        return slices
    }
    
    /// Splits or iterates over the array in number of groups, padding any remaining
    /// slots with `with` unless it is false.
    ///
    /// 	arr.inGroup(0)              #=> []
    /// 	arr.inGroup(3)              #=> [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]]
    /// 	arr.inGroup(4)              #=> [[1, 2, 3], [4, 5, 6], [7, 8], [9, 10]]
    /// 	arr.inGroup(4, fill: 0)     #=> [[1, 2, 3], [4, 5, 6], [7, 8, 0], [9, 10, 0]]
    ///
    /// 	arr.inGroup(4, fill: 0) { group in
    ///         print(group)    #=> [1, 2, 3], [4, 5, 6], [7, 8, 0], [9, 10, 0]
    ///     }
    ///
    /// - Parameters:
    ///   - num: The size of array in the two dimentional array.
    ///   - with: An element used to padding remaining slot in the last array.
    ///   - closure: A closure recevies array as parameter
    /// - Returns: A two dimentional array of `Element`.
    @discardableResult
    func inGroup(_ num: Int, fill with: Element? = nil, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
        guard num.isPositive else { return [] }
        let division = length / num
        let modulo = length % num
        var elements = self
        var groups: [[Element]] = []
        
        0.upto(num-1) {
            let length = division + (modulo.isPositive && modulo > $0 ? 1 : 0)
            var lastGroup = elements.shift(length)
            
            if let with = with, modulo.isPositive && length == division {
                lastGroup.append(with)
            }
            groups.append(lastGroup)
        }
        return groups
    }
    
    /// Divides the array into one or more subarrays based on a delimiting `value`
    /// or the result of an block.
    ///
    ///     let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    /// 	arr.split(3)    #=> [[1, 2], [4, 5, 6, 7, 8, 9, 10]]
    ///
    /// 	arr.split { 
    ///         $0 % 3 == 0 
    ///     }   #=> [[1, 2], [4, 5], [7, 8], [10]]
    ///
    /// - Parameter closure: A closure accepts element and returns bool value.
    /// - Returns: A nested array.
    @discardableResult
    func split(_ closure: (Element) -> Bool) -> [[Element]] {
        var groups: [[Element]] = []
        var lastGroup: [Element] = []
        eachWithIndex { (index, elem) in
            if closure(elem) {
                groups.append(lastGroup)
                lastGroup = []
            } else {
                lastGroup.append(elem)
            }
            
            if index == self.length - 1 {
                groups.append(lastGroup)
            }
        }
        return groups
    }
}

public extension Array where Element: Equatable {
    /// Divides the array into one or more subarrays based on a delimiting `value`
    /// or the result of an block.
    ///
    ///     let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    /// 	arr.split(3)    #=> [[1, 2], [4, 5, 6, 7, 8, 9, 10]]
    ///
    /// 	arr.split {
    ///         $0 % 3 == 0
    ///     }   #=> [[1, 2], [4, 5], [7, 8], [10]]
    ///
    /// - Parameter value: A value used to split the array.
    /// - Returns: A nested array.
    @discardableResult
    func split(_ value: Element) -> [[Element]] {
        return split { $0 == value }
    }
}
