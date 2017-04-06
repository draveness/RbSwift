//
//  Date+Relative.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Relative
public extension Duration {
    var since: Date {
        return since()
    }
    
    var `in`: Date {
        return since
    }
    
    var fromNow: Date {
        return fromNow()
    }

    var later: Date {
        return since
    }
    
    var ago: Date {
        return ago()
    }
    
    var before: Date {
        return ago
    }
    
    func before(_ date: Date = Date.now) -> Date {
        return ago(date)
    }
    
    func later(_ date: Date = Date.now) -> Date {
        return since(date)
    }
    
    func since(_ date: Date = Date.now) -> Date {
        return Calendar.global.date(byAdding: self.to_dateComponents, to: date)!
    }
    
    func fromNow(_ date: Date = Date.now) -> Date {
        return since(date)
    }
    
    func ago(_ date: Date = Date.now) -> Date {
        return Calendar.global.date(byAdding: self.to_dateComponents(before: true), to: date)!
    }
}
