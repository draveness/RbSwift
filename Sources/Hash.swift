//
//  Hash.swift
//  RbSwift
//
//  Created by draveness on 01/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// Hash is an alias to Dictionary
typealias Hash<K: Hashable, V> = Dictionary<K, V>

public func + <K,V>(left: Dictionary<K, V>, right: Dictionary<K, V>)
    -> Dictionary<K, V> {
    var map = Dictionary<K, V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}
