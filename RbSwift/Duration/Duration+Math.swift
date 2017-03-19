//
//  Duration+Math.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Duration {
    static func +(lhs: Duration, rhs: Duration) -> Duration {
        var newValues: [Duration.DurationComponent: Int] = [:]
        lhs.values.forEach { (key, value) in
            newValues[key] = rhs.values[key]! + value
        }
        return Duration(values: newValues)
    }
    
    static func -(lhs: Duration, rhs: Duration) -> Duration {
        var newValues: [Duration.DurationComponent: Int] = [:]
        lhs.values.forEach { (key, value) in
            newValues[key] = value - rhs.values[key]!
        }
        return Duration(values: newValues)
    }
}

