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
    
    var values: [DurationComponent: Int] = [
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
    
    /// Convert duration to seconds
    ///
    ///     1.year.toSeconds        #=> 31556952 (length of a gregorian year 365.2425 days)
    ///     1.month.toSeconds       #=> 2629746  (1/12 of a gregorian year)
    ///     1.week.toSeconds        #=> 604800
    ///     1.day.toSeconds         #=> 86400
    ///     1.hour.toSeconds        #=> 3600
    ///     1.minute.toSeconds      #=> 60
    ///     1.second.toSeconds      #=> 1
    ///
    public var toSeconds: Int {
        return values.reduce(0) { $0 + secondsPerComponent[$1.0]! * $1.1 }
    }
    
    init(values: [DurationComponent: Int]) {
        self.values = values
    }
    
    private let secondsPerComponent: [Duration.DurationComponent: Int] = [
        .years: 31556952, // length of a gregorian year (365.2425 days)
        .months: 2629746, // 1/12 of a gregorian year
        .weeks: 604800,
        .days: 86400,
        .hours: 3600,
        .minutes: 60,
        .seconds: 1]
}

extension Duration: CustomStringConvertible {
    public var description: String {
        return values.filter { $1 != 0 }.map { "\($1) \($0.rawValue)" }.joined(separator: ", ")
    }
}
