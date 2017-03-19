//
//  Conversions.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

fileprivate let radix = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

// MARK: - Conversions
public extension String {
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36).
    /// Extraneous characters past the end of a valid number are ignored. 
    /// If there is not a valid number at the start of str, 0 is returned. 
    /// This method returns 0 when base is valid.
    var to_i: Int {
        return to_i(10)
    }
    
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36).
    /// Extraneous characters past the end of a valid number are ignored.
    /// If there is not a valid number at the start of str, 0 is returned.
    /// This method returns 0 when base is valid.
    ///
    /// - Parameter base: A int indicates the integer base
    /// - Returns: A integer based on the integer base
    func to_i(_ base: Int = 10) -> Int {
        guard Array(2...36).contains(base) else { return 0 }
        let nums = radix[0..<base]
        var result = ""
        for char in split("") {
            guard nums.contains(char) else { break }
            result.append(char)
        }
        
        var value = 0
        for (index, bit) in result.reverse.split("").enumerated() {
            value += Int(pow(Double(base), Double(index))) * nums.index(of: bit)!
        }
        return value
    }
    
    /// Returns the result of interpreting the receiver in different standard.
    /// This methods returns `nil`, if the receiver is not in Custom, ISO8601, RFC2822 or CTime form.
    /// - SeeAlso: DateFormat
    var to_datetime: Date? {
        return Date(str: self)
    }
}
