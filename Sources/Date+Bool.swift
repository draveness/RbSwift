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
    var isSunday: Bool {
        return _components.weekday! == 1
    }

    var isMonday: Bool {
        return _components.weekday! == 2
    }
    
    var isTuesday: Bool {
        return _components.weekday! == 3
    }
    
    var isWednesday: Bool {
        return _components.weekday! == 4
    }
    
    var isThursday: Bool {
        return _components.weekday! == 5
    }
    
    var isFriday: Bool {
        return _components.weekday! == 6
    }
    
    var isSaturday: Bool {
        return _components.weekday! == 7
    }
    
    var isLeapYear: Bool {
        return ((year % 100 != 0) && (year % 4 == 0)) || year % 400 == 0
    }
}
