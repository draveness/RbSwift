//
//  TimeZonePatch.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

public extension TimeZone {
    static let utc: TimeZone = TimeZone(abbreviation: "UTC")!
    static let gmt: TimeZone = TimeZone(abbreviation: "GMT")!
}
