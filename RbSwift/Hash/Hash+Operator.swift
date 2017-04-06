//
//  Hash+Operator.swift
//  RbSwift
//
//  Created by Draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// Returns a new hash containing the contents of `otherHash` and the contents of hsh. the value
/// for entries with duplicate keys will be that of `rhs`
///
///     let h1 = ["a": 100, "b": 200]
///     let h2 = ["b": 254, "c": 300]
/// 	h1 + h2		#=> ["a": 100, "b": 254, "c": 300]
///
/// - Parameters:
///   - left: A hash.
///   - right: Another hash.
/// - Returns:  Returns a new hash containing the contents of `otherHash` and the contents of hsh.
public func +<K, V>(lhs: Hash<K, V>, rhs: Hash<K, V>) -> Hash<K, V> {
    return lhs.merge(rhs)
}
