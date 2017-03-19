//
//  Case.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    /// Returns a copy of str with all uppercase letters replaced with their lowercase counterparts. 
    var downcase: String {
        return self.lowercased()
    }
    
    /// Downcases the contents of the receiver
    mutating func downcased() {
        self = downcase
    }
    
    /// Returns a copy of str with all lowercase letters replaced with their uppercase counterparts.
    var upcase: String {
        return self.uppercased()
    }
    
    /// Upcases the contents of the receiver
    mutating func upcased() {
        self = upcase
    }
    
    /// Returns a copy of str with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase.
    var swapcase: String {
        return self.split("").map { $0.isUpcase ? $0.downcase : $0.upcase }.joined()
    }
    
    /// Equivalent to `swapcase`, but modifies the receiver in place.
    mutating func swapcased() {
        self = swapcase
    }
}
