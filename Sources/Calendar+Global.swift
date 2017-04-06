//
//  Calendar+Global.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Global
public extension Calendar {
    /// Returns a Calendar with `GlobalTimeZone`.
    static var global: Calendar {
        var result = Calendar.current
        result.timeZone = TimeZone.global
        return result
    }
}
