//
//  Components.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

fileprivate let calendar = Calendar.current
fileprivate let allComponents: [Calendar.Component] = [.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .weekdayOrdinal, .quarter, .timeZone, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .calendar]

public extension Date {
    private var _components: DateComponents {
        return calendar.dateComponents(in: currentTimeZone, from: self)
    }
    
    /// The number of era units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var era: Int {
        return _components.era ?? 0
    }
    
    /// The number of year units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var year: Int {
        return _components.year ?? 0
    }
    
    /// The number of month units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var month: Int {
        return _components.month ?? 0
    }
    
    /// The number of day units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var day: Int {
        return _components.day ?? 0
    }
    
    /// The number of hour units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var hour: Int {
        return _components.hour ?? 0
    }
    
    /// The number of minute units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var minute: Int {
        return _components.minute ?? 0
    }
    
    /// The number of second units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var second: Int {
        return _components.second ?? 0
    }
    
    /// The number of nanosecond units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var nanosecond: Int {
        return _components.nanosecond ?? 0
    }
    
    /// The number of weekday units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekday: Int {
        return _components.weekday ?? 0
    }
    
    /// The number of weekdayOrdinal units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekdayOrdinal: Int {
        return _components.weekdayOrdinal ?? 0
    }
    
    /// The number of quarter units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var quarter: Int {
        return _components.quarter ?? 0
    }
    
    /// The number of weekOfMonth units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekOfMonth: Int {
        return _components.weekOfMonth ?? 0
    }
    
    /// The number of weekOfYear units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var weekOfYear: Int {
        return _components.weekOfYear ?? 0
    }
    
    /// The number of yearForWeekOfYear units for the receiver.
    /// - note: This value is interpreted in the context of the calendar and timezone with which it is used
    var yearForWeekOfYear: Int {
        return _components.yearForWeekOfYear ?? 0
    }
}
