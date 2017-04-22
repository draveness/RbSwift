//
//  Array+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Transform
public extension Array {
    /// When invoked with a closure, pass all combinations of length n of elements
    /// from the array and then returns the array itself.
    /// The implementation makes no guarantees about the order in which the combinations are yielded.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.combination(1) #=> [[1], [2], [3]]
    ///     arr.combination(2) #=> [[1, 2], [1, 3], [2, 3]]
    ///     arr.combination(3) #=> [[1, 2, 3]]
    ///     arr.combination(0) #=> []
    ///     arr.combination(5) #=> [[]]
    ///
    /// - Parameters:
    ///   - num: The length of combination in the returning array
    ///   - closure: A closure called each time finds a new combination
    /// - Returns: An new array with all the possible combination in the receiver array
    @discardableResult
    func combination(_ num: Int, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
        guard num.isPositive && !self.isEmpty else { return [] }
        guard num <= self.length else { return [[]] }
        var bits = Array<Int>(Array<Int>(0..<num).reversed())
        
        func lastBit() -> Int? {
            for (index, bit) in bits.enumerated() {
                if bit + index < self.length - 1 {
                    bits[index] += 1
                    return bit
                }
            }
            return nil
        }
        
        var results: [[Element]] = []
        
        while true {
            var result: [Element] = []
            for index in bits.reversed() {
                result.append(self[index])
            }
            if let closure = closure { closure(result) }
            results.append(result)
            if lastBit() == nil {
                break
            }
        }
        return results
    }
    
    /// When invoked with a closure, pass all **repeated** combinations of length n of elements
    /// from the array and then returns the array itself.
    /// The implementation makes no guarantees about the order in which the combinations are yielded.
    ///
    ///     let arr = [1, 2, 3]
    ///     arr.repeatedCombination(1) #=> [[1],[2],[3]]
    ///     arr.repeatedCombination(2) #=> [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
    ///     arr.repeatedCombination(3) #=> [[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],[1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]]
    ///     arr.repeatedCombination(4) #=> [[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,2],[1,1,2,3],[1,1,3,3],
    ///         [1,2,2,2],[1,2,2,3],[1,2,3,3],[1,3,3,3], [2,2,2,2],[2,2,2,3],[2,2,3,3],[2,3,3,3],[3,3,3,3]]
    ///     arr.repeatedCombination(0) #=> []
    ///
    /// - Parameters:
    ///   - num: The length of combination in the returning array
    ///   - closure: A closure called each time finds a new combination
    /// - Returns: An new array with all the possible repeated combination in the receiver array
    @discardableResult
    func repeatedCombination(_ num: Int, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
        guard num.isPositive && !self.isEmpty else { return [] }
        var bits = Array<Int>(repeating: 0, count: num)
        var largest = ([Int](repeating: 0, count: num) + [1]).to_i(self.length)
        func lastBit() -> Bool {
            if bits.to_i(self.length) < largest - 1 {
                bits = (bits.to_i(self.length) + 1).digits(self.length)
                
                // all the bits should in desc order to remove dupliate
                while bits.sorted(by: >) != bits {
                    bits = (bits.to_i(self.length) + 1).digits(self.length)
                }
                
                // adding placeholder integer
                while bits.length < num {
                    bits.append(0)
                }
                
                return false
            }
            return true
        }
        
        var results: [[Element]] = []
        
        while true {
            var result: [Element] = []
            
            for index in bits.reversed() {
                result.append(self[index])
            }
            if let closure = closure { closure(result) }
            results.append(result)
            if lastBit() {
                break
            }
        }
        return results
    }
    
    /// Extracts the nested value specified by the sequence of idx objects by
    /// calling dig at each step, returning nil if any intermediate step is nil.
    ///
    ///     let a = [[1, 2, 3], [3, 4, 5]]
    ///     a.dig(0)                    #=> [1, 2, 3]
    ///     a.dig(1, 2)                 #=> 5
    ///     a.dig(1, 2, 3)              #=> nil
    ///     a.dig(10, 2, 3)             #=> nil
    ///
    /// - Parameter idxs: A sequence of int specify the value location in the recevier array.
    /// - Returns: An value in the nested array or nil
    func dig<T>(_ idxs: Int...) -> T? {
        return dig(idxs)
    }
    
    /// Extracts the nested value specified by the sequence of idx objects by 
    /// calling dig at each step, returning nil if any intermediate step is nil.
    ///
    ///     let a = [[1, 2, 3], [3, 4, 5]]
    ///     a.dig(0)                    #=> [1, 2, 3]
    ///     a.dig(1, 2)                 #=> 5
    ///     a.dig(1, 2, 3)              #=> nil
    ///     a.dig(10, 2, 3)             #=> nil
    ///
    /// - Parameter idxs: A sequence of int specify the value location in the recevier array.
    /// - Returns: An value in the nested array or nil
    func dig<T>(_ idxs: [Int]) -> T? {
        guard self.length.isPositive else { return nil }
        guard let firstIdx = idxs.first else { return nil }
        guard firstIdx < self.length else { return nil }
        let element = self[firstIdx]
        if let element = element as? [T] {
            return element.dig(idxs.drop(1))
        } else if idxs.count == 1 {
            return element as? T
        } else {
            return nil
        }
    }

    /// Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
    ///
    ///     let a = [ 4, 5, 6 ]
    ///     let b = [ 7, 8, 9 ]
    ///     [1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    ///
    /// This generates a nested n-element arrays, where n is the least count of all the ararys including the receiver.
    ///
    ///     [1, 2].zip(a, b)      #=> [[1, 4, 7]]
    ///     a.zip([1, 2], [8])    #=> [[4, 1, 8]]
    ///
    /// - Parameter arrays: Another arrays with type [T]
    /// - Returns: An new nested array
    func zip<T>(_ arrays: [T]...) -> [[T]] {
        let minLength = arrays.reduce(Int.max) { $1.length < $0 ? $1.length : $0 }
        let arr = self.first(minLength)
        let results = arr.mapWithIndex { (index, data) -> [T] in
            var result: [T] = []
            if let element = data as? T {
                result.append(element)
                for array in arrays {
                    result.append(array[index])
                }
            }
            return result
        }
        return results
    }
    
    /// Returns the tranpose of the current two-dimentional array.
    ///
    ///     let a = [[1, 2], [3, 4], [5, 6]]
    ///     a.transpose()   #=> [[1, 3, 5], [2, 4, 6]]
    ///
    /// If the receiver's elements have different length, `Array#transpose()` will
    /// return `nil`.
    ///
    ///     let b = [[1, 2], [3], [5, 6, 7]]
    ///     b.transpose()   #=> nil
    ///
    /// - Returns: An new array or nil
    func tranpose<T>() -> [[T]]? {
        if self.isEmpty { return [[T]]() }
        var original: [[T]] = []
        for element in self {
            if let element = element as? [T] {
                original.append(element)
            } else {
                return nil
            }
        }
        let allowTranspose = original.map { $0.count }.uniq.count == 1
        guard allowTranspose else { return nil }
        let count = original.first!.count

        var results = [[T]](repeating: [T](), count: count)
        for rows in original {
            for (index, item) in rows.enumerated() {
                results[index].append(item)
            }
        }
        return results
    }
    
    /// Returns a new array by rotating `self` so that the element at `count` is the first element of the new array.
    /// 
    ///     let a = [ "a", "b", "c", "d" ]
    ///     a.rotate         #=> ["b", "c", "d", "a"]
    ///     a                #=> ["a", "b", "c", "d"]
    ///
    /// - See also: Array#rotate(count:)
    var rotate: [Element] {
        return rotate()
    }
    
    /// Returns a new array by rotating `self` so that the element at `count` is the first element of the new array.
    ///
    ///     let a = [ "a", "b", "c", "d" ]
    ///     a.rotate         #=> ["b", "c", "d", "a"]
    ///     a                #=> ["a", "b", "c", "d"]
    ///     a.rotate(2)      #=> ["c", "d", "a", "b"]
    /// 
    /// If `count` is negative then it rotates in the opposite direction, starting from the end of `self` where -1 is
    /// the last element.
    ///
    ///     a.rotate(-3)     #=> ["b", "c", "d", "a"]
    ///
    /// - Parameter count: The element in the first place after rotate
    /// - Returns: A new array
    func rotate(_ count: Int = 1) -> [Element] {
        var rotate = count % self.length
        while rotate < 0 { rotate += self.length }
        let head = self.first(rotate).to_a
        let tail = self.dropFirst(rotate).to_a
        return tail + head
    }
    
}

public extension Array where Element == String {
    /// Returns a new string by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// The following example shows how an array of strings can be joined to a
    /// single, comma-separated string:
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let list = cast.join(", ")
    ///     print(list)
    ///     // Prints "Vivien, Marlon, Kim, Karl"
    ///
    /// - Parameter separator: A string to insert between each of the elements
    ///   in this sequence. The default separator is an empty string.
    /// - Returns: A single, concatenated string.
    func join(_ separator: String = "") -> String {
        return joined(separator: separator)
    }
}
