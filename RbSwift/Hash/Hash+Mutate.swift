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
    mutating func store(_ key: Key, _ value: Value) -> Value {
        self[key] = value
        return value
    }
}
