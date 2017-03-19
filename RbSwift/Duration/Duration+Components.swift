//
//  Duration+Components.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Duration {
    var years: Int {
        return self.values[.years]!
    }
    
    var months: Int {
        return self.values[.months]!
    }
    
    var weeks: Int {
        return self.values[.weeks]!
    }
    
    var days: Int {
        return self.values[.days]!
    }
    
    var hours: Int {
        return self.values[.hours]!
    }
    
    var minutes: Int {
        return self.values[.minutes]!
    }
    
    var seconds: Int {
        return self.values[.seconds]!
    }
}
