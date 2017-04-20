//
//  Hash+Enumeration.swift
//  RbSwift
//
//  Created by draveness on 07/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Enumeration
public extension Hash {
    /// Calls block once for each key in hsh, passing the key-value pair as parameters.
    /// An alias to `Sequence#each(closure:)` method.
    ///
    ///     let hash = ["a": 100, "b": 200]
    ///     var result: [String: Int] = [:]
    ///     hash.eachPair {
    ///         result[$0] = $1 + 100
    ///     })          #=> ["a": 100, "b": 200]
    ///
    ///     result      #=> ["a": 200, "b": 300]
    ///
    /// - Parameter closure: An closure accepts key-value pair as parameters.
    /// - Returns: Self.
    @discardableResult
    func eachPair(closure: (Key, Value) -> Void) -> Hash<Key, Value> {
        return self.each(closure)
    }
    
    /// Calls block once for each key in hsh, passing the key as parameters.
    ///
    ///     let hash = ["a": 100, "b": 200]
    ///     var result: [String] = []
    ///     hash.eachKey {
    ///         result.append($0)
    ///     })          #=> ["a", "b"]
    ///
    ///     result      #=> ["a": 100, "b": 200]
    ///
    /// - Parameter closure: An closure accepts key as parameters.
    /// - Returns: Self.
    @discardableResult
    func eachKey(closure: (Key) -> Void) -> Hash<Key, Value> {
        self.keys.reverseEach(closure)
        return self
    }
    
    /// Calls block once for each key in hsh, passing the value as parameters.
    ///
    ///     let hash = ["a": 100, "b": 200]
    ///     var result: [Int] = []
    ///     hash.eachValue {
    ///         result.append($0)
    ///     })          #=> [100, 200]
    ///
    ///     result      #=> ["a": 100, "b": 200]
    ///
    /// - Parameter closure: An closure accepts value as parameters.
    /// - Returns: Self.
    @discardableResult
    func eachValue(closure: (Value) -> Void) -> Hash<Key, Value> {
        self.values.reverseEach(closure)
        return self
    }
}
