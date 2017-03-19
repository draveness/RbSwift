//
//  Date+Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Date {
    var to_utc: Date {
        return utc
    }

    var utc: Date {
        let dateFormatter = DateFormat.Custom()
        return dateFormatter.date(from: "\(self)")!
    }
}
