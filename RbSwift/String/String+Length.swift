//
//  Length.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Length
public extension String {
    /// Returns the length of string.
    var length: Int {
        return self.characters.count
    }
    
    /// Returns the length of string.
    var size: Int {
        return self.length
    }
    
    /// Returns the length of string.
    var count: Int {
        return self.length
    }
}
