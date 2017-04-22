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
    
    /// An alias to `Hash#merge(otherHash:)` methods.
    ///
    /// - Parameters:
    ///   - otherHash: Another hash instance.
    ///   - closure: A closure returns a new value if duplicate happens.
    /// - Returns: A new hash containing the contents of both hash.
    func update(_ otherHash: Hash<Key, Value>, closure: ((Key, Value, Value) -> Value)? = nil) -> Hash<Key, Value> {
        return merge(otherHash, closure: closure)
    }
    
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
    @discardableResult
    mutating func merged(_ otherHash: Hash<Key, Value>, closure: ((Key, Value, Value) -> Value)? = nil) -> Hash<Key, Value> {
        self = self.merge(otherHash, closure: closure)
        return self
    }
    
    /// An alias to `Hash#merged(otherHash:)` methods.
    ///
    /// - Parameters:
    ///   - otherHash: Another hash instance.
    ///   - closure: A closure returns a new value if duplicate happens.
    /// - Returns: Self
    @discardableResult
    mutating func updated(_ otherHash: Hash<Key, Value>, closure: ((Key, Value, Value) -> Value)? = nil) -> Hash<Key, Value> {
        return merged(otherHash, closure: closure)
    }

    /// Removes all key-value pairs from hsh.
    ///
    ///     var hash = ["a": 100]
    /// 	hash.clear()		#=> [:]
    /// 	hash                #=> [:]
    ///
    /// - Returns: Self with empty hash.
    @discardableResult
    mutating func clear() -> Hash<Key, Value> {
        self = [:]
        return self
    }
    
    /// An alias to `Hash#removeValue(forKey:)`.
    ///
    ///     var hash = ["a": 100, "b": 200]
    /// 	hash.delete("a")		#=> 100
    /// 	hash                    #=> ["b": 200]
    ///
    /// - Parameter key: A key of hash.
    /// - Returns: Corresponding value or nil.
    @discardableResult
    mutating func delete(_ key: Key) -> Value? {
        return self.removeValue(forKey: key)
    }
    
    /// Replaces the contents of hsh with the contents of otherHash.
    ///
    ///     var hash = ["a": 100, "b": 200]
    /// 	hash.replace(["c": 300])		#=> ["c": 300]
    /// 	hash                            #=> ["c": 300]
    ///
    /// - Parameter otherHash: Another hash instance.
    /// - Returns: Self
    @discardableResult
    mutating func replace(_ otherHash: Hash<Key, Value>) -> Hash<Key, Value> {
        self = otherHash
        return self
    }
    
    /// Associates the value given by value with the key given by key.
    ///
    ///     var hash = ["a": 4]
    /// 	hash.store("b", 5)		#=> 5
    /// 	hash                    #=> ["a": 4, "b": 5]
    ///
    /// - Parameters:
    ///   - key: A key
    ///   - value: A value
    /// - Returns: The passing value
    @discardableResult
    mutating func store(_ key: Key, _ value: Value) -> Value {
        self[key] = value
        return value
    }
    
    /// Removes a key-value pair from hsh and returns it as the two-item 
    /// array ( key, value ), or nil if the hash is empty.
    ///
    ///     var hash = ["a": 4]
    /// 	hash.shift()		#=> ("b", 5)
    /// 	hash.shift()		#=> nil
    ///
    /// - Returns: A key-value pair
    @discardableResult
    mutating func shift() -> (Key, Value)? {
        if let key = self.keys.first {
            return (key, delete(key)!)
        }
        return nil
    }
    
    /// Return a new with the results of running block once for every value.
    /// This method does not change the keys.
    ///
    ///     let hash = ["a": 1, "b": 2, "c": 3]
    /// 	hash.transformValues { $0 * $0 + 1 }    #=> ["a": 2, "b": 5, "c": 10]
    /// 	hash.transformValues { $0.to_s }		#=> ["a": "1", "b": "2", "c": "3"]
    ///
    /// - Parameter closure: An closure accepts a value return an new value.
    /// - Returns: An new hash with key-value pair
    func transformValues<T>(_ closure: @escaping (Value) -> T) -> [Key: T] {
        var results: [Key: T] = [:]
        for (key, value) in self {
            results[key] = closure(value)
        }
        return results
    }
    
    /// Return a new with the results of running block once for every value.
    /// This method does not change the keys. The mutates version of
    /// `Hash#transformedValues(closure:)` can only accepts a closure with
    /// `(Value) -> Value` type.
    ///
    ///     var hash = ["a": 1, "b": 2, "c": 3]
    /// 	hash.transformedValues { 
    ///         $0 * $0 + 1 
    ///     }		#=> ["a": 2, "b": 5, "c": 10]
    /// 	hash    #=> ["a": 2, "b": 5, "c": 10]
    ///
    /// - Parameter closure: An closure accepts a value return an new value.
    /// - Returns: Self
    @discardableResult
    mutating func transformedValues(_ closure: @escaping (Value) -> Value) -> [Key: Value] {
        var results: [Key: Value] = [:]
        for (key, value) in self {
            results[key] = closure(value)
        }
        self = results
        return self
    }
}

public extension Hash where Value: Hashable {
    /// Returns a new hash created by using hsh’s values as keys, and the keys as values. 
    ///
    ///     let hash1 = ["a": 100, "b": 200]
    /// 	hash1.invert            #=> [100: "a", 200: "b"]
    ///
    ///     let hash2 = ["cat": "feline", "dog": "canine", "cow": "bovine"]
    /// 	hash2.invert.invert		#=> ["cat": "feline", "dog": "canine", "cow": "bovine"]
    ///
    /// If a key with the same value already exists in the hsh, then the last one defined
    /// will be used, the earlier value(s) will be discarded.
    ///
    ///     let hash3 = ["cat": 1, "dog": 1]
    /// 	hash3.invert    #=> [1: "dog"]
    ///
    var invert: [Value: Key] {
        var results: [Value: Key] = [:]
        for (key, value) in self {
            results[value] = key
        }
        return results
    }
}
