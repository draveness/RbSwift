//
//  Bridge.swift
//  RbSwift
//
//  Created by draveness on 17/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension NSString {
    var bridge: String {
        return self as String
    }
}

public extension String {
    var bridge: NSString {
        return self as NSString
    }
}

