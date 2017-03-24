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
        guard num < self.length else { return nil }
        return self[num]
    }
    
    /// Choose a random element from the array.
    /// If the array is empty the `Array#sample` returns nil and the `Array#sample(n:)` form returns an empty array.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.sample      #=> 2
    ///     arr.sample      #=> 1
    ///     arr.sample      #=> 1
    ///     arr.sample      #=> 2
    ///     arr.sample      #=> 3
    ///     arr             #=> [1, 2, 3]
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
    /// - Parameter n: An integer of random elements count
    /// - Returns: An new array with random elements
    func sample(_ n: Int = 1) -> [Element] {
        guard n > 0 else { return [] }
        var candidates: [Element] = self
        var results: [Element] = []
        while results.count < n {
            let random: Int = Int(arc4random() % candidates.length.to_u32)
            results.append(candidates[random])
            candidates.remove(at: random)
        }
        return results
    }
}
