//
//  Number+Enumeration.swift
//  RbSwift
//
//  Created by draveness on 20/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Int {
    /// Returns an array of int from self down to and including limit.
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    /// - Returns: An array of int self...limit
    func downto(_ limit: Int, step: Int = 1) -> [Int] {
        guard self >= limit else { return [] }
        var result: [Int] = [self]
        while result.last! > limit {
            let next = result.last! + step * -1
            if next >= limit {
                result.append(next)
            } else {
                break
            }
        }
        return result
    }
    
    /// Iterates the given block, passing decreasing values from int down to and including limit.
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    ///   - closure: A closure accepts an integer
    func downto(_ limit: Int, step: Int = 1, closure: (Int) -> Void) {
        return downto(limit).forEach(closure)
    }
    
    /// Returns an array of int from self up to and including limit.
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    /// - Returns: An array of int limit...self
    func upto(_ limit: Int, step: Int = 1) -> [Int] {
        guard self <= limit else { return [] }
        var result: [Int] = [self]
        while result.last! < limit {
            let next = result.last! + step
            if next <= limit {
                result.append(next)
            } else {
                break
            }
        }
        return result
    }
    
    /// Iterates the given block, passing increasing values from int up to and including limit.
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    ///   - closure: A closure accepts an integer
    func upto(_ limit: Int, step: Int = 1, closure: (Int) -> Void) {
        return upto(limit).forEach(closure)
    }
    
    /// Execute the block for self times
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    func times(closure: @escaping (Void) -> Void) {
        0.upto(self - 1).forEach { _ in
            closure()
        }
    }
    
    /// Execute the block for self times
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    /// - Returns: An array
    func times<T>(closure: @escaping (Void) -> T) -> [T] {
        var result: [T] = []
        0.upto(self - 1).forEach { _ in
            result.append(closure())
        }
        return result
    }
    
    /// Execute the block with counter for self times
    ///
    /// - Parameter closure: A closure accepts an int counter and returns Void
    func times(closure: (Int) -> Void) {
        0.upto(self - 1).forEach(closure)
    }
    
    
    /// Execute the block for self times
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    /// - Returns: An array
    func times<T>(closure: @escaping (Int) -> T) -> [T] {
        var result: [T] = []
        0.upto(self - 1).forEach { index in
            result.append(closure(index))
        }
        return result
    }
}
