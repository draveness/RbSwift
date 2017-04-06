//
//  Duration+Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Conversions
public extension Duration {
    /// Convert duration to seconds in string form.
    var to_s: String {
        return "\(toSeconds)"
    }
    
    /// Convert duration to seconds.
    ///
    ///     1.year.to_i     #=> 31556952 (length of a gregorian year 365.2425 days)
    ///     1.month.to_i    #=> 2629746 ( 1/12 of a gregorian year)
    ///     1.week.to_i     #=> 604800
    ///     1.day.to_i      #=> 86400
    ///     1.hour.to_i     #=> 3600
    ///     1.minute.to_i   #=> 60
    ///     1.second.to_i   #=> 1
    ///
    var to_i: Int {
        return toSeconds
    }
    
    var to_dateComponents: DateComponents {
        return to_dateComponents()
    }
    
    /// Convert current struct to a `DateComponents` object, all the components of 
    /// duration will be assigned to `DateComponents` object.
    ///
    /// - Parameter before: A bool value indicates the sign of date components
    /// - Returns: A `DateComponents` object containing all the date info
    func to_dateComponents(before: Bool = false) -> DateComponents {
        var dateComponents = DateComponents()
        let sign = before ? -1 : 1
        dateComponents.year = self.years * sign
        dateComponents.month = self.months * sign
        dateComponents.day = (self.days + self.weeks * 7) * sign
        dateComponents.hour = self.hours * sign
        dateComponents.minute = self.minutes * sign
        dateComponents.second = self.seconds * sign
        return dateComponents
    }
}
