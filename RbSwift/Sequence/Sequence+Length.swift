//
//  Length.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Length
public extension Sequence {
    /// Returns length of sequence.
    var length: Int {
        return count
    }
    
    /// Returns length of sequence.
    var size: Int {
        return count
    }
    
    /// Returns length of sequence.
    var count: Int {
        var i = 0
        self.forEach { _ in i += 1 }
        return i
    }
}
