//
//  Hash+Operator.swift
//  RbSwift
//
//  Created by Draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// Creates a hash with the merging result of two passed in `Hash` struct
///
/// - Parameters:
///   - left: <#left description#>
///   - right: <#right description#>
/// - Returns: <#return value description#>
public func + <K, V>(left: Hash<K, V>, right: Hash<K, V>) -> Hash<K, V> {
    var map = Hash<K, V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}
