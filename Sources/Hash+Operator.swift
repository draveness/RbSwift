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
/// - Parameters:
///   - left: A hash.
///   - right: Another hash.
/// - Returns:  Returns a new hash containing the contents of `otherHash` and the contents of hsh.
public func +<K, V>(lhs: Hash<K, V>, rhs: Hash<K, V>) -> Hash<K, V> {
    return lhs.merge(rhs)
}
