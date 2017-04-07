//
//  Hash+Access.swift
//  RbSwift
//
//  Created by Draveness on 07/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Access 
public extension Hash {
    /// Returns an array of optinal value with given keys.
    ///
    ///     let hash = ["cat": "feline", "dog": "canine", "cow": "bovine"]
    /// 	hash.values(at: "cat", "dog")           #=> ["feline", "canine"]
    /// 	hash.values(at: "catcat", "dog")		#=> [nil, "canine"]
    ///
    /// - Parameter keys: An array of keys.
    /// - Returns: An optioanl value of array.
    func values(at keys: Key...) -> [Value?] {
        return values(at: keys)
    }
    
    /// Returns an array of optinal value with given keys.
    ///
    ///     let hash = ["cat": "feline", "dog": "canine", "cow": "bovine"]
    /// 	hash.values(at: ["cat", "dog"])         #=> ["feline", "canine"]
    /// 	hash.values(at: ["catcat", "dog"])		#=> [nil, "canine"]
    ///
    /// - Parameter keys: An array of keys.
    /// - Returns: An optioanl value of array.
    func values(at keys: [Key]) -> [Value?] {
        return keys.map { self[$0] }
    }
    
    /// Searches through the hash with key using `subscript`. Returns the key-value tuple
    /// or nil if no match is found.
    ///
    ///     let hash = [1: "one", 2: "two", 3: "three"]
    /// 	hash.assoc(1)       #=> (1, "one")
    /// 	hash.assoc(42)      #=> nil
    ///
    /// - Parameter key: An key of type `Key`
    /// - Returns: A key-value tuple or `nil`.
    func assoc(_ key: Key) -> (Key, Value)? {
        guard let value = self[key] else { return nil }
        return (key, value)
    }
}

// MARK: - Access
public extension Hash where Value: Equatable {
    /// Searches through the hash with value using `subscript`. Returns the key-value tuple
    /// or nil if no match is found.
    ///
    ///     let hash = [1: "one", 2: "two", 3: "three"]
    /// 	hash.rassoc("one")          #=> (1, "one")
    /// 	hash.rassoc("forty-two")    #=> nil
    ///
    /// - Parameter key: An key of type `Key`
    /// - Returns: A key-value tuple or `nil`.
    func rassoc(_ value: Value) -> (Key, Value)? {
        for (k, v) in self {
            if value == v {
                return (k, v)
            }
        }
        return nil
    }
}
