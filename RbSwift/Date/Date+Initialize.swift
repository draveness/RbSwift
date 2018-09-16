//
//  DatePatch.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Format
public extension Date {
    /// Returns a date from given string or nil.
    /// `Date#parse(str:)` can only parse string in several forms.
    ///
    /// - Parameter str: A string
    /// - Returns: A date object or nil
    /// - See Also: `DateFormat#parse(str:)`
    static func parse(str: String, locale: Locale = Locale.current) -> Date? {
        guard let date = DateFormat.parse(str: str, locale: locale) else { return nil }
        return date
    }
    
    init?(str: String, locale: Locale = Locale.current) {
        guard let date = DateFormat.parse(str: str, locale: locale) else { return nil }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    
    init?(_ year: Int = -4712, _ month: Int = 1, _ day: Int = 1, _ hour: Int = 1, _ minute: Int = 1, _ second: Int = 1) {
        let dateComponents = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        guard let date = Calendar.global.date(from: dateComponents) else { return nil }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    
    /// Creates a `Date` instance with `timespec` struct.
    ///
    /// - Parameter timespec: A timespec struct.
    init(timespec: timespec) {
        let seconds = timespec.tv_sec.to_double
        let nanosends = timespec.tv_nsec.to_double
        self.init(timeIntervalSince1970: seconds + nanosends / 1000)
    }
}
