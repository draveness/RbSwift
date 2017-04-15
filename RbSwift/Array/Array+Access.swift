//
//  Array+Access.swift
//  RbSwift
//
//  Created by draveness on 24/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Access
public extension Array {
    /// Returns the nth element in the array or nil.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.at(0) #=> 1
    ///     arr.at(4) #=> nil
    ///
    /// - Parameter num: The element index
    /// - Returns: An element at specific index or nil
    func at(_ num: Int) -> Element? {
        guard num < length else { return nil }
        return self[num]
    }
    
    /// Choose a random element from the array.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.sample      #=> 2
    ///     arr.sample      #=> 1
    ///     arr.sample      #=> 1
    ///     arr.sample      #=> 2
    ///     arr.sample      #=> 3
    ///     arr             #=> [1, 2, 3]
    ///
    /// If the array is empty `Array#sample` returns `nil`.
    ///
    ///     [].sample       #=> nil
    ///
    var sample: Element? {
        return sample().first
    }
    
    /// Choose a random element or n random elements from the array.
    /// The elements are chosen by using random and unique indices into the array in order to ensure that 
    /// an element doesn’t repeat itself unless the array already contained duplicate elements.
    /// If the array is empty the `Array#sample` returns nil and the `Array#sample(n:)` form returns an empty array.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.sample(1)       #=> [2]
    ///     arr.sample(2)       #=> [1, 2]
    ///     arr.sample(2)       #=> [1, 3]
    ///     arr.sample(2)       #=> [3, 1]
    ///     arr.sample(3)       #=> [3, 1, 2]
    ///     arr.sample(4)       #=> [2, 3, 1]
    ///     arr.sample(0)       #=> []
    ///     arr                 #=> [1, 2, 3]
    ///
    /// If the array is empty `Array#sample(n:)` returns an empty array.
    ///
    ///     [].sample()         #=> []
    ///
    /// - Parameter n: An integer of random elements count
    /// - Returns: An new array with random elements
    func sample(_ n: Int = 1) -> [Element] {
        guard n.isPositive else { return [] }
        var candidates: [Element] = self
        var results: [Element] = []
        while results.count < n {
            let random: Int = Int(arc4random() % candidates.length.to_u32)
            results.append(candidates[random])
            candidates.remove(at: random)
        }
        return results
    }
    
    /// Returns a new array with elements of `self` shuffled.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.shuffle         #=> [1, 2, 3]
    ///     arr.shuffle         #=> [3, 2, 1]
    ///     arr.shuffle         #=> [2, 1, 3]
    ///     arr.shuffle         #=> [1, 3, 2]
    ///     arr                 #=> [1, 3, 2]
    ///
    var shuffle: [Element] {
        return sample(self.length)
    }
    
    /// Returns the tail of the array from the `position`.
    ///
    /// 	["a", "b", "c", "d"].from(0)		#=> ["a", "b", "c", "d"]
    /// 	["a", "b", "c", "d"].from(2)		#=> ["c", "d"]
    /// 	["a", "b", "c", "d"].from(10)   #=> []
    /// 	[].from(0)                      #=> []
    /// 	["a", "b", "c", "d"].from(-2)   #=> ["c", "d"]
    /// 	["a", "b", "c"].from(-10)		#=> []
    ///
    /// - Parameter position: An integer value.
    /// - Returns: An sub array of Element.
    func from(_ position: Int) -> [Element] {
        guard position <= length && position >= -length else { return [] }
        let startIndex = position >= 0 ? position : position + length
        return self[startIndex..<length].to_a
    }
    
    /// Returns the beginning of the array up to the `position`.
    ///
    /// 	["a", "b", "c", "d"].to(0)		#=> ["a"]
    /// 	["a", "b", "c", "d"].to(2)		#=> ["a", "b", "c"]
    /// 	["a", "b", "c", "d"].to(10)		#=> ["a", "b", "c", "d"]
    /// 	[].to(0)                        #=> []
    /// 	["a", "b", "c", "d"].to(-2)		#=> ["a", "b", "c"]
    /// 	["a", "b", "c"].to(-10)         #=> []
    ///
    /// - Parameter position: An integer value.
    /// - Returns: An sub array of Element.
    func to(_ position: Int) -> [Element] {
        guard position >= -length else { return [] }
        let endIndex = position >= 0 ? Swift.min(position + 1, length) : position + length + 1
        return self[0..<endIndex].to_a
    }
}

public extension Array where Element: Equatable {
    /// Returns a copy of the Array without the specified elements.
    ///
    ///     let people = ["David", "Rafael", "Aaron", "Todd"]
    /// 	people.without("David", "Aaron")		#=> ["Rafael", "Todd"]
    ///
    /// - Parameter elements: An array of specific elements.
    /// - Returns: An new array.
    func without(_ elements: Element...) -> [Element] {
        return self - elements
    }
}
