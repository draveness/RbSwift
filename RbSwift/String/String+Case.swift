//
//  Case.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Case
public extension String {
    /// Returns a copy of str with all uppercase letters replaced with their lowercase counterparts. 
    var downcase: String {
        return self.lowercased()
    }
    
    /// Downcases the contents of the receiver
    ///
    /// - Returns: Self
    @discardableResult mutating func downcased() -> String {
        self = downcase
        return self
    }
    
    /// Returns a copy of str with all lowercase letters replaced with their uppercase counterparts.
    var upcase: String {
        return self.uppercased()
    }
    
    /// Upcases the contents of the receiver
    ///
    /// - Returns: Self
    @discardableResult mutating func upcased() -> String {
        self = upcase
        return self
    }
    
    /// Returns a copy of str with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase.
    var swapcase: String {
        return self.chars.map { $0.isUpcase ? $0.downcase : $0.upcase }.joined()
    }
    
    /// Equivalent to `swapcase`, but modifies the receiver in place.
    ///
    /// - Returns: Self
    @discardableResult mutating func swapcased() -> String {
        self = swapcase
        return self
    }
}
