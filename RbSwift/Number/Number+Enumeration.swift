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
    /// 	3.downto(1)         #=> [3, 2, 1]
    /// 	3.downto(-2)		#=> [3, 2, 1, 0, -1, -2]
    /// 	3.downto(3)         #=> [3]
    /// 	3.downto(4)         #=> []
    ///
    /// 	3.downto(-2, step: 2)		#=> [3, 1, -1]
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
    ///     var result: [Int] = []
    ///     3.downto(1) { 
    ///         result.append($0) 
    ///     }
    /// 	result		#=> [3, 2, 1]
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    ///   - closure: A closure accepts an integer
    func downto(_ limit: Int, step: Int = 1, closure: (Int) throws -> Void) rethrows {
        return try downto(limit).forEach(closure)
    }
    
    /// Returns an array of int from self up to and including limit.
    ///
    /// 	1.upto(3)		#=> [1, 2, 3]
    /// 	(-2).upto(3)    #=> [-2, -1, 0, 1, 2, 3]
    /// 	3.upto(3)		#=> [3]
    /// 	3.upto(4)		#=> [3, 4]
    /// 	(-2).upto(3, step: 2)		#=> [-2, 0, 2]
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
    ///     var result: [Int] = []
    ///     1.upto(3) {
    ///         result.append($0)
    ///     }
    /// 	result		#=> [1, 2, 3]
    ///
    /// - Parameters:
    ///   - limit: A integer specifies the last int to enumerate
    ///   - step: A int used to step the array
    ///   - closure: A closure accepts an integer
    func upto(_ limit: Int, step: Int = 1, closure: (Int) throws -> Void) rethrows {
        return try upto(limit).forEach(closure)
    }
    
    /// Execute the block for self times
    ///
    ///     3.times { i in
    ///         print(i)    #=> 0, 1, 2
    ///     }
    ///
    ///     3.times {
    ///         print(1)    #=> 1, 1, 1
    ///     }
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    func times(_ closure: @escaping (Void) throws -> Void) rethrows {
        try 0.upto(self - 1).forEach { _ in
            try closure()
        }
    }
    
    /// Execute the block for self times
    ///
    ///     let arr: [Int] = 3.times {
    ///         return 1
    ///     }
    /// 	arr		#=> [1, 1, 1]
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    /// - Returns: An array
    @discardableResult
    func times<T>(_ closure: @escaping (Void) throws -> T) rethrows -> [T] {
        var result: [T] = []
        try 0.upto(self - 1).forEach { _ in
            try result.append(closure())
        }
        return result
    }
    
    /// Execute the block with counter for self times
    ///
    ///     3.times { i in
    ///         print(i)    #=> 0, 1, 2
    ///     }
    ///
    ///     3.times {
    ///         print(1)    #=> 1, 1, 1
    ///     }
    ///
    /// - Parameter closure: A closure accepts an int counter and returns Void
    func times(_ closure: (Int) throws -> Void) rethrows {
        try 0.upto(self - 1).forEach(closure)
    }
    
    
    /// Execute the block for self times
    ///
    ///     let arr: [Int] = 3.times {
    ///         return $0
    ///     }
    /// 	arr		#=> [0, 1, 2]
    ///
    /// - Parameter closure: A closure accepts Void and returns Void
    /// - Returns: An array
    @discardableResult
    func times<T>(_ closure: @escaping (Int) throws -> T) rethrows -> [T] {
        var result: [T] = []
        try 0.upto(self - 1).forEach { index in
            try result.append(closure(index))
        }
        return result
    }
}
