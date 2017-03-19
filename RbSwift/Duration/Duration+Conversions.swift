//
//  Duration+Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Duration {        
    var to_s: String {
        return "\(toSeconds)"
    }
    
    var to_i: Int {
        return toSeconds
    }
    
    var to_dateComponents: DateComponents {
        return to_dateComponents()
    }
    
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
