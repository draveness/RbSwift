//
//  Array+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Array {
    /// When invoked with a closure, pass all combinations of length n of elements
    /// from the array and then returns the array itself.
    /// The implementation makes no guarantees about the order in which the combinations are yielded.
    ///
    /// - Parameters:
    ///   - num: The length of combination in the returning array
    ///   - closure: A closure called each time finds a new combination
    /// - Returns: An new array with all the possible combination in the receiver array
    @discardableResult func combination(_ num: Int, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
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
    /// - Parameters:
    ///   - num: The length of combination in the returning array
    ///   - closure: A closure called each time finds a new combination
    /// - Returns: An new array with all the possible repeated combination in the receiver array
    @discardableResult func repeatedCombination(_ num: Int, closure: (([Element]) -> Void)? = nil) -> [[Element]] {
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
            
            print(bits)
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
    /// - Parameter idxs: A sequence of int specify the value location in the recevier array.
    /// - Returns: An value in the nested array or nil
    func dig<T>(_ idxs: Int...) -> T? {
        return dig(idxs)
    }
    
    /// Extracts the nested value specified by the sequence of idx objects by 
    /// calling dig at each step, returning nil if any intermediate step is nil.
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
    /// This generates a sequence of `minimum` n-element arrays, where n is one more than the count of arguments.
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
            print(result)
            return result
        }
        return results
    }
    
    public func transpose<T>(input: [[T]]) -> [[T]] {
        if input.isEmpty { return [[T]]() }
        let count = input[0].count
        var out = [[T]](repeating: [T](), count: count)
        for outer in input {
            for (index, inner) in outer.enumerated() {
                out[index].append(inner)
            }
        }
        
        return out
    }

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
        let count = original[0].count

        var results = [[T]](repeating: [T](), count: count)
        for rows in original {
            for (index, item) in rows.enumerated() {
                results[index].append(item)
            }
        }
        
        return results
    }
}


