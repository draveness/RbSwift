//
//  Hash+Mutate.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Mutate
public extension Hash {
    /// A mutating version of `Hash#merge(otherHash:closure:)`
    ///
    ///     let h1 = ["a": 100, "b": 200]
    ///     let h2 = ["b": 254, "c": 300]
    ///
    /// 	h1.merge(h2)		#=> ["a": 100, "b": 254, "c": 300]))
    /// 	h1                  #=> ["a": 100, "b": 254, "c": 300]))
    ///
    /// - Parameters:
    ///   - otherHash: Another hash instance.
    ///   - closure: A closure returns a new value if duplicate happens.
    /// - Returns: Self
    @discardableResult mutating func merged(_ otherHash: Hash<Key, Value>, closure: ((Key, Value, Value) -> Value)? = nil) -> Hash<Key, Value> {
        self = self.merge(otherHash, closure: closure)
        return self
    }
    
    /// Removes all key-value pairs from hsh.
    ///
    /// - Returns: Self with empty hash.
    @discardableResult mutating func clear() -> Hash<Key, Value> {
        self = [:]
        return self
    }
}
