//
//  DatePatch.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Format
public extension Date {
    static func parse(str: String) -> Date? {
        guard let date = DateFormat.parse(str: str) else { return nil }
        return date
    }
    
    init?(str: String) {
        guard let date = DateFormat.parse(str: str) else { return nil }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
}
