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
}
