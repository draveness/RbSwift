//
//  DateFormat.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// A dateformatter which provides default `DateFormatter` converts string to `Date` object.
public struct DateFormat {
    static func Custom() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZ"
        dateFormatter.timeZone = TimeZone.global
        dateFormatter.locale = Locale.current
        return dateFormatter
    }
    
    static func ISO8601() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone.global
        dateFormatter.locale = Locale.current
        return dateFormatter
    }
    
    static func RFC2822() -> DateFormatter {
        // "Sun, 19 Mar 2017 01:02:04 +0800"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMM yyyy HH:mm:ss ZZZ"
        dateFormatter.timeZone = TimeZone.global
        dateFormatter.locale = Locale.current
        return dateFormatter
    }
    
    static func CTime() -> DateFormatter {
        // "Sun Mar 19 01:04:21 2017"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM d HH:mm:ss yyyy"
        dateFormatter.timeZone = TimeZone.global
        dateFormatter.locale = Locale.current
        return dateFormatter
    }
    
    /// Returns a date with given string, `DateFormat#parse(str:)` use serveral formats to
    /// retrieve the date inforamtion from the string.
    ///
    /// 1. Custom format    "yyyy-MM-dd HH:mm:ss ZZZZ"
    /// 2. ISO8601 format   "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    /// 3. RFC2822 format   "EEE, d MMM yyyy HH:mm:ss ZZZ"
    /// 4. CTime format     "EEE MMM d HH:mm:ss yyyy"
    ///
    ///     DateFormat.parse("Sun, 19 Mar 2017 01:02:04 +0800") #=> 2017-03-19 01:02:04 +0800
    ///
    /// - Parameter str: A given string contains the date information
    /// - Returns: A date object or nil
    public static func parse(str: String) -> Date? {
        if let date = DateFormat.Custom().date(from: str) {
            return date
        } else if let date = DateFormat.ISO8601().date(from: str) {
            return date
        } else if let date = DateFormat.RFC2822().date(from: str) {
            return date
        } else if let date = DateFormat.CTime().date(from: str) {
            return date
        } else {
            return nil
        }
    }
}
