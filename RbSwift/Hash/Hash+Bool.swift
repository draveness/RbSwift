//
//  Hash+Bool.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Hash {
    /// Passes each element of the collection to the given block. The method returns 
    /// true if the block ever returns a value other than false or nil.
    ///
    ///     let h1 = ["a": 100, "b": 200]
    /// 	h1.isAny { (key, _) in key == "a" }		#=> true
    /// 	h1.isAny { (key, _) in key == "c" }		#=> false
    ///
    /// - Parameter closure: A closure accepts key and value pair from the hash.
    /// - Returns: A bool value.
    func isAny(closure: (Key, Value) -> Bool) -> Bool {
        return reduce(false) { (result, element) in
            return result || closure(element.key, element.value)
        }
    }
    
    /// Returns `true` if the given key is present in hsh.
    ///
    /// - Parameter key: A string represent key in hsh.
    /// - Returns: A bool value.
    func hasKey(_ key: Key) -> Bool {
        return reduce(false) { (result, element) in
            return result || key == element.key
        }
    }
}

public extension Hash where Value: Equatable {
    
    /// Returns `true` if the given value is present in hsh.
    ///
    /// - Parameter key: A string represent value in hsh.
    /// - Returns: A bool value.
    func hasValue(_ value: Value) -> Bool {
        return reduce(false) { (result, element) in
            return result || value == element.value
        }
    }
}
