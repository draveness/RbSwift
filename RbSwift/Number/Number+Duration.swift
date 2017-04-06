//
//  Number+Duration.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Duration
public extension Int {
    /// Return a duration with `self` years
    var years: Duration {
        return Duration(years: self)
    }
    
    /// An alias to `years`
    var year: Duration {
        return years
    }
    
    /// Return a duration with `self` months
    var months: Duration {
        return Duration(months: self)
    }
    
    /// An alias to `months`
    var month: Duration {
        return months
    }
    
    /// Return a duration with `self` weeks
    var weeks: Duration {
        return Duration(weeks: self)
    }
    
    /// An alias to `weeks`
    var week: Duration {
        return weeks
    }
    
    /// Return a duration with `self` days
    var days: Duration {
        return Duration(days: self)
    }
    
    /// An alias to `days`
    var day: Duration {
        return days
    }
    
    /// Return a duration with `self` hours
    var hours: Duration {
        return Duration(hours: self)
    }
    
    /// An alias to `hour`
    var hour: Duration {
        return hours
    }

    /// Return a duration with `self` minutes
    var minutes: Duration {
        return Duration(minutes: self)
    }
    
    /// An alias to `minute`
    var minute: Duration {
        return minutes
    }

    /// Return a duration with `self` seconds
    var seconds: Duration {
        return Duration(seconds: self)
    }
    
    /// An alias to `seconds`
    var second: Duration {
        return seconds
    }
}
