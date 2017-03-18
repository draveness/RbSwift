//
//  Duration.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public struct Duration {
    enum DurationComponent: String {
        case years = "years"
        case months = "months"
        case weeks = "weeks"
        case days = "days"
        case hours = "hours"
        case minutes = "minutes"
        case seconds = "seconds"
    }
    
    fileprivate var values: [DurationComponent: Int] = [
        .years: 0, // length of a gregorian year (365.2425 days)
        .months: 0, // 1/12 of a gregorian year
        .weeks: 0,
        .days: 0,
        .hours: 0,
        .minutes: 0,
        .seconds: 0]
    
    public init(years: Int = 0, months: Int = 0, weeks: Int = 0,
         days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        self.values[.years] = years
        self.values[.weeks] = weeks
        self.values[.months] = months
        self.values[.days] = days
        self.values[.hours] = hours
        self.values[.minutes] = minutes
        self.values[.seconds] = seconds
    }
    
    fileprivate init(values: [DurationComponent: Int]) {
        self.values = values
    }
}

let secondsPerComponent: [Duration.DurationComponent: Int] = [
    .years: 31556952, // length of a gregorian year (365.2425 days)
    .months: 2629746, // 1/12 of a gregorian year
    .weeks: 604800,
    .days: 86400,
    .hours: 3600,
    .minutes: 60,
    .seconds: 1]


public extension Duration {
    var years: Int {
        return self.values[.years]!
    }
    
    var months: Int {
        return self.values[.months]!
    }
    
    var weeks: Int {
        return self.values[.weeks]!
    }
    
    var days: Int {
        return self.values[.days]!
    }
    
    var hours: Int {
        return self.values[.hours]!
    }
    
    var minutes: Int {
        return self.values[.minutes]!
    }
    
    var seconds: Int {
        return self.values[.seconds]!
    }
    
    var toSeconds: Int {
        return values.reduce(0) { $0 + secondsPerComponent[$1.0]! * $1.1 }
    }
    
    var to_s: String {
        return "\(toSeconds)"
    }
    
    var to_i: Int {
        return toSeconds
    }
}

extension Duration: Comparable, Equatable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <(lhs: Duration, rhs: Duration) -> Bool {
        return lhs.toSeconds < rhs.toSeconds
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: Duration, rhs: Duration) -> Bool {
        return lhs.toSeconds == rhs.toSeconds
    }
}
