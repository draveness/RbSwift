//
//  Duration+Components.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Components
public extension Duration {
    /// Retrieve the years component from duration instance.
    var years: Int {
        return self.values[.years]!
    }
    
    /// Retrieve the months component from duration instance.
    var months: Int {
        return self.values[.months]!
    }
    
    /// Retrieve the weeks component from duration instance.
    var weeks: Int {
        return self.values[.weeks]!
    }
    
    /// Retrieve the days component from duration instance.
    var days: Int {
        return self.values[.days]!
    }
    
    /// Retrieve the hours component from duration instance.
    var hours: Int {
        return self.values[.hours]!
    }
    
    /// Retrieve the minutes component from duration instance.
    var minutes: Int {
        return self.values[.minutes]!
    }
    
    /// Retrieve the seconds component from duration instance.
    var seconds: Int {
        return self.values[.seconds]!
    }
}
