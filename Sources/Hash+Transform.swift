//
//  Hash+Transform.swift
//  RbSwift
//
//  Created by Draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Transform
public extension Hash {
    /// Returns a new hash containing the contents of `otherHash` and the contents of hsh.
    /// If no block is specified, the value for entries with duplicate keys will be that 
    /// of `otherHash`. 
    ///
    ///     let h1 = ["a": 100, "b": 200]
    ///     let h2 = ["b": 254, "c": 300]
    ///
    /// 	h1.merge(h2)		#=> ["a": 100, "b": 254, "c": 300]))
    ///
    /// Otherwise the value for each duplicate key is determined by calling
    /// the block with the key, its value in hsh and its value in `otherHash`.
    ///
    /// 	h1.merge(h2) { (key, oldval, newval) in
    ///         newval - oldval
    ///     }		#=> ["a": 100, "b": 54,  "c": 300]
    ///
    /// 	h1		#=> ["a": 100, "b": 200]
    ///
    /// - Parameters:
    ///   - otherHash: Another hash instance.
    ///   - closure: A closure returns a new value if duplicate happens.
    /// - Returns: A new hash containing the contents of both hash.
    func merge(_ otherHash: Hash<Key, Value>, closure: ((Key, Value, Value) -> Value)? = nil) -> Hash<Key, Value> {
        var map = Hash<Key, Value>()
        for (k, v) in self {
            map[k] = v
        }
        for (key, value) in otherHash {
            if let oldValue = map[key],
                let closure = closure {
                map[key] = closure(key, oldValue, value)
            } else {
                map[key] = value
            }
        }
        return map
    }
}
