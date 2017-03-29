//
//  Duration+Math.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Math
public extension Duration {
    /// Returns a new `Duration` with the sum of the two `Duration`
    ///
    ///     1.year + 1.year                 #=> 2.years
    ///     2.years + 3.years               #=> 5.years
    ///     2.years + 1.year + 1.month      #=> 3.years + 1.month
    ///
    /// - Parameters:
    ///   - lhs: A duration
    ///   - rhs: Another duration
    /// - Returns: A new duration
    static func +(lhs: Duration, rhs: Duration) -> Duration {
        var newValues: [Duration.DurationComponent: Int] = [:]
        lhs.values.forEach { (key, value) in
            newValues[key] = rhs.values[key]! + value
        }
        return Duration(values: newValues)
    }
    
    /// Returns a new `Duration` with the subtraction from the left hand side `Duration` 
    /// with the right hand side.
    ///
    ///     1.year - 1.year                 #=> 0.year
    ///     2.year - 1.year                 #=> 1.year
    ///     2.years - 3.years               #=> (-1).year
    ///     2.years - 1.year - 1.month      #=> 1.year - 1.month
    ///
    /// - Parameters:
    ///   - lhs: A duration
    ///   - rhs: Another duration
    /// - Returns: A new duration
    static func -(lhs: Duration, rhs: Duration) -> Duration {
        var newValues: [Duration.DurationComponent: Int] = [:]
        lhs.values.forEach { (key, value) in
            newValues[key] = value - rhs.values[key]!
        }
        return Duration(values: newValues)
    }
}

