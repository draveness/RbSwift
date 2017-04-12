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
    
    /// Returns a value from the hash for the given key.
    ///
    ///     let hash = ["a": 100, "b": 200]
    /// 	hash.fetch("a")		#=> 100
    ///
    /// If the key can’t be found, there are several options:
    /// With no other arguments, it will return nil; 
    ///
    /// 	hash.fetch("z")		#=> nil
    ///
    /// if default is given, then that will be returned;
    ///
    /// 	hash.fetch("z", 500)		#=> 500
    ///
    /// - Parameters:
    ///   - key: A key.
    ///   - default: Default value if key can't be found.
    /// - Returns: A value or nil
    func fetch(_ key: Key, _ default: Value) -> Value {
        return self[key] ?? `default`
    }
    
    /// Returns a value from the hash for the given key.
    ///
    ///     let hash = ["a": 100, "b": 200]
    /// 	hash.fetch("a")		#=> 100
    ///
    /// If the key can’t be found, there are several options:
    /// if the optional code block is specified, then that will be run and its result returned.
    ///
    /// 	hash.fetch("z", closure: { _ in
    ///         return 1000
    ///     })		#=> 1000
    ///
    /// - Parameters:
    ///   - key: A key.
    ///   - closure: A code block will executes on the key if not found.
    /// - Returns: A value or nil
    func fetch(_ key: Key, closure: ((Key) -> Value)? = nil) -> Value? {
        guard let value = self[key] else {
            guard let closure = closure else { return nil }
            return closure(key)
        }
        return value
    }
    
    /// Returns an array containing the values associated with the given keys or `nil` 
    /// when one of keys can’t be found. Also see Hash#values(at:) and Hash#fetch(key:).
    ///
    ///     let hash = ["cat": "feline", "dog": "canine", "cow": "bovine"]
    /// 	hash.fetchValues("cow", "cat")!		#=> ["bovine", "feline"]
    /// 	hash.fetchValues("cow", "bird")		#=> nil
    ///
    /// - Parameter keys: An array of keys.
    /// - Returns: An array of values or nil.
    func fetchValues(_ keys: Key...) -> [Value]? {
        var results: [Value] = []
        for key in keys {
            guard let result = fetch(key) else { return nil }
            results.append(result)
        }
        return results
    }
    
    /// Returns an array containing the values associated with the given keys or `nil`
    /// when one of keys can’t be found. Also see Hash#values(at:) and Hash#fetch(key:).
    ///
    ///     let hash = ["cat": "feline", "dog": "canine", "cow": "bovine"]
    /// 	hash.fetchValues("cow", "bird") { key in
    ///         return key.upcase
    ///     }		#=> ["bovine", "BIRD"]
    ///
    /// - Parameters:
    ///   - keys: An array of keys.
    ///   - closure: A closure executs each time value is not found.
    /// - Returns: An array of values.
    func fetchValues(_ keys: Key..., closure: ((Key) -> Value)) -> [Value] {
        return keys.map { key in
            guard let result = fetch(key) else { return closure(key) }
            return result
        }
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
