//
//  Date+Bool.swift
//  RbSwift
//
//  Created by draveness on 29/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Date {
    /// Returns true if the date is Sunday.
    var isSunday: Bool {
        return _components.weekday! == 1
    }

    /// Returns true if the date is Monday.
    var isMonday: Bool {
        return _components.weekday! == 2
    }
    
    /// Returns true if the date is Tuesday.
    var isTuesday: Bool {
        return _components.weekday! == 3
    }
    
    /// Returns true if the date is Wednesday.
    var isWednesday: Bool {
        return _components.weekday! == 4
    }
    
    /// Returns true if the date is Thursday.
    var isThursday: Bool {
        return _components.weekday! == 5
    }
    
    /// Returns true if the date is Friday.
    var isFriday: Bool {
        return _components.weekday! == 6
    }
    
    /// Returns true if the date is Saturday.
    var isSaturday: Bool {
        return _components.weekday! == 7
    }
    
    /// Returns true if the date is leap year.
    var isLeapYear: Bool {
        return ((year % 100 != 0) && (year % 4 == 0)) || year % 400 == 0
    }
}
