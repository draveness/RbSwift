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
}
