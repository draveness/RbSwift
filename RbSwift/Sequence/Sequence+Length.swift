//
//  Length.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Sequence {    
    var length: Int {
        return count
    }
    
    var size: Int {
        return count
    }
    
    var count: Int {
        var i = 0
        self.forEach { _ in i += 1 }
        return i
    }
}
