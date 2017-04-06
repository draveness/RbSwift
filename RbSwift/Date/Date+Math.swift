//
//  Date+Math.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Math
public extension Date {
    /// Converting the right hand side argument `Duration` to `DateComponents` first and add
    /// it to the left hand side `Date` object.
    ///
    ///     let date = Date(str: "2017-01-01 00:00:00 +0000")!
    ///     date + 1.year                   #=> 2018-01-01 00:00:00 +0000
    ///     date + 2.years                  #=> 2019-01-01 00:00:00 +0000
    ///     date + 2.years + 1.month        #=> 2019-02-01 00:00:00 +0000
    ///
    /// - Parameters:
    ///   - lhs: A date
    ///   - rhs: A duration
    /// - Returns: A new date which add the duration to the old date
    static func +(lhs: Date, rhs: Duration) -> Date {
        return Calendar.global.date(byAdding: rhs.to_dateComponents, to: lhs)!
    }
    
    /// Converting the right hand side argument `Duration` to `DateComponents` first and minus
    /// it to the left hand side `Date` object.
    ///
    ///     let date = Date(str: "2017-01-01 00:00:00 +0000")!
    ///     date - 1.year                   #=> 2016-01-01 00:00:00 +0000
    ///     date - 2.years                  #=> 2015-01-01 00:00:00 +0000
    ///
    /// - Parameters:
    ///   - lhs: A date
    ///   - rhs: A duration
    /// - Returns: A new date which minus the duration to the old date
    static func -(lhs: Date, rhs: Duration) -> Date {
        return Calendar.global.date(byAdding: rhs.to_dateComponents(before: true), to: lhs)!
    }
}
