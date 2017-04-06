//
//  Components.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

private var calendar = Calendar.global

private let allComponents: [Calendar.Component] = [.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .weekdayOrdinal, .quarter, .timeZone, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .calendar]

// MARK: - Components
public extension Date {
    var _components: DateComponents {
        return calendar.dateComponents(in: TimeZone.global, from: self)
    }
    
    /// The number of era units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var era: Int {
        get {
            return _components.era ?? 0
        }
    }
    
    /// The number of year units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var year: Int {
        get {
            return _components.year ?? 0
        }
    }
    
    /// The number of month units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var month: Int {
        get {
            return _components.month ?? 0
        }
    }
    
    /// The number of day units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var day: Int {
        get {
            return _components.day ?? 0
        }
    }
    
    /// The number of hour units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var hour: Int {
        get {
            return _components.hour ?? 0
        }
    }
    
    /// The number of minute units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var minute: Int {
        get {
            return _components.minute ?? 0
        }
    }
    
    /// The number of second units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var second: Int {
        get {
            return _components.second ?? 0
        }
    }
    
    /// The number of nanosecond units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var nanosecond: Int {
        get {
            return _components.nanosecond ?? 0
        }
    }
    
    /// The number of weekday units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekday: Int {
        get {
            return _components.weekday ?? 0
        }
    }
    
    /// The number of weekdayOrdinal units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekdayOrdinal: Int {
        get {
            return _components.weekdayOrdinal ?? 0
        }
    }
    
    /// The number of quarter units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var quarter: Int {
        get {
            return _components.quarter ?? 0
        }
    }
    
    /// The number of weekOfMonth units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekOfMonth: Int {
        get {
            return _components.weekOfMonth ?? 0
        }
    }
    
    /// The number of weekOfYear units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekOfYear: Int {
        get {
            return _components.weekOfYear ?? 0
        }
    }
    
    /// The number of yearForWeekOfYear units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var yearForWeekOfYear: Int {
        get {
            return _components.yearForWeekOfYear ?? 0
        }
    }
}
