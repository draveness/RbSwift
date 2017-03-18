//
//  DatePatch.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation


public var GlobalTimeZone: TimeZone = TimeZone.current

public extension Date {
    var currentTimeZone: TimeZone {
        return GlobalTimeZone
    }
    
    var utc: Date {
        let dateFormatter = DateFormat.Custom()
        return dateFormatter.date(from: "\(self)")!
    }
}
