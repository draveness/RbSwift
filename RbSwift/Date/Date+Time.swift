//
//  Date+Duration.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Time
public extension Date {
    /// Alias to `Date#new` returns a new date with current date time.
    static var now: Date {
        return Date()
    }

    /// Returns a new Date representing the date 1 day after today
    static var tommorow: Date {
        return Date() + 1.day
    }
    
    /// Returns a new Date representing the date 1 day before today
    static var yesterday: Date {
        return Date() - 1.day
    }
    
    /// Returns a date with timestamp, use `Date(timeIntervalSince1970:)`
    /// initializer to create a new date.
    ///
    /// - Parameter timestamp: A unix timestamp
    /// - Returns: A date
    static func at(_ timestamp: Int) -> Date {
        return Date(timeIntervalSince1970: timestamp.to_double)
    }
    
    /// Returns a date with timestamp, use `Date(timeIntervalSince1970:)`
    /// initializer to create a new date.
    ///
    /// - Parameter timestamp: A unix timestamp
    /// - Returns: A date
    static func at(_ timestamp: Double) -> Date {
        return Date(timeIntervalSince1970: timestamp)
    }
    
    /// Returns a new Date where one or more of the elements have been changed according to the passing parameter. 
    ///
    /// - Parameters:
    ///   - year: A int value
    ///   - month: A int value
    ///   - day: A int value
    ///   - hour: A int value
    ///   - minute: A int value
    ///   - second: A int value
    /// - Returns: A new date
    func change(year: Int? = nil, month: Int? = nil, day: Int? = nil,
                hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        var dateComponents = Calendar.global.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        if let year = year      { dateComponents.setValue(year,   for: .year) }
        if let month = month    { dateComponents.setValue(month,  for: .month) }
        if let day = day        { dateComponents.setValue(day,    for: .day) }
        if let hour = hour      { dateComponents.setValue(hour,   for: .hour) }
        if let minute = minute  { dateComponents.setValue(minute, for: .minute) }
        if let second = second  { dateComponents.setValue(second, for: .second) }
        return Calendar.global.date(from: dateComponents)!
    }
    
    /// Returns and changes `self` where one or more of the elements have been changed according to the passing parameter.
    ///
    /// - Parameters:
    ///   - year: A int value
    ///   - month: A int value
    ///   - day: A int value
    ///   - hour: A int value
    ///   - minute: A int value
    ///   - second: A int value
    /// - Returns: Self
    @discardableResult
    mutating func changed(year: Int? = nil, month: Int? = nil, day: Int? = nil,
                                    hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        self = change(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        return self
    }
    
    enum Period {
        case midnight
        case beginningOfDay
        case noon
        case midday
        case middleOfDay
        case endOfDay
    }
    
    /// Adjusts receiver and returns an new date with corresponding time period.
    ///
    /// - Parameter period: An enum specify time period
    /// - Returns: A new date
    func at(_ period: Period) -> Date {
        switch period {
        case .midnight, .beginningOfDay:
            return beginningOfDay
        case .midday, .noon, .middleOfDay:
            return middleOfDay
        case .endOfDay:
            return endOfDay
        }
    }
    
    /// Converts Date with the time portion set to the beginning of the day (0:00)
    var beginningOfDay: Date {
        return change(hour: 0, minute: 0, second: 0)
    }
    
    /// Converts Date with the time portion set to the beginning of the day (0:00)
    var midnight: Date {
        return beginningOfDay
    }
    
    /// Converts Date with the time portion set to the middle of the day (12:00)
    var middleOfDay: Date {
        return change(hour: 12, minute: 0, second: 0)
    }
    
    /// Converts Date with the time portion set to the middle of the day (12:00)
    var midday: Date {
        return middleOfDay
    }
    
    /// Converts Date with the time portion set to the middle of the day (12:00)
    var noon: Date {
        return middleOfDay
    }
    
    /// Converts Date with the time portion set to the end of the day (23:59:59)
    var endOfDay: Date {
        return change(hour: 23, minute: 59, second: 59)
    }
    
    /// Returns a date object denoting the following day.
    var next: Date {
        return self + 1.day
    }
    
    /// Returns a date object denoting the following day.
    var nextDay: Date {
        return nextDay()
    }
    
    /// Returns a date object denoting the following month.
    var nextMonth: Date {
        return nextMonth()
    }
    
    /// Returns a date object denoting the following year.
    var nextYear: Date {
        return nextYear()
    }
    
    /// Returns a date object denoting the previous day.
    var prevDay: Date {
        return prevDay()
    }
    
    /// Returns a date object denoting the previous month.
    var prevMonth: Date {
        return prevMonth()
    }
    
    /// Returns a date object denoting the previous year.
    var prevYear: Date {
        return prevYear()
    }
    
    /// Returns a date object pointing other days after self. The other should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func nextDay(_ n: Int = 1) -> Date {
        return self + n.days
    }
    
    /// Returns a date object pointing n months after self. The argument n should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func nextMonth(_ n: Int = 1) -> Date {
        return self + n.months
    }
    
    /// Returns a date object pointing n years after self. The argument n should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func nextYear(_ n: Int = 1) -> Date {
        return self + n.years
    }
    
    /// Returns a date object pointing other days before self. The other should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func prevDay(_ n: Int = 1) -> Date {
        return self - n.days
    }

    /// Returns a date object pointing n months before self. The argument n should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func prevMonth(_ n: Int = 1) -> Date {
        return self - n.months
    }
    
    /// Returns a date object pointing n years before self. The argument n should be a numeric value.
    ///
    /// - Parameter n: A integer value
    /// - Returns: A new date
    func prevYear(_ n: Int = 1) -> Date {
        return self - n.years
    }
}
