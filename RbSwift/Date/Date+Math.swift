//
//  Date+Math.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Math
public extension Date {
    static func +(lhs: Date, rhs: Duration) -> Date {
        return Calendar.current.date(byAdding: rhs.to_dateComponents, to: lhs)!
    }
    
    static func -(lhs: Date, rhs: Duration) -> Date {
        return Calendar.current.date(byAdding: rhs.to_dateComponents(before: true), to: lhs)!
    }
}
