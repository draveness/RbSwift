//
//  Conversions.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

fileprivate let radix = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

fileprivate let integers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

// MARK: - Conversions
public extension String {
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36).
    /// Extraneous characters past the end of a valid number are ignored. 
    /// If there is not a valid number at the start of str, 0 is returned. 
    /// This method returns 0 when base is invalid.
    var to_i: Int {
        return to_i(10)
    }
    
    
    /// Treats leading characters from str as a string of hexadecimal digits (with an optional sign and an optional 0x)
    /// and returns the corresponding number. Zero is returned on error.
    var to_hex: Int {
        let sign = isStartWith("-") ? -1 : 1
        let str = isStartWith("-") ? self.substring(from: 1) : self
        guard str.isStartWith("0x") else { return str.to_i(16) * sign }
        return str.substring(from: 2).to_i(16) * sign
    }
    
    /// An alias to `to_hex` method.
    var hex: Int {
        return to_hex
    }
    
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36).
    /// Extraneous characters past the end of a valid number are ignored.
    /// If there is not a valid number at the start of str, 0 is returned.
    /// This method returns 0 when base is invalid.
    ///
    /// - Parameter base: A int indicates the integer base
    /// - Returns: A integer based on the integer base
    func to_i(_ base: Int = 10) -> Int {
        guard Array(2...36).contains(base) else { return 0 }
        let nums = radix[0..<base]
        var chars = self.chars
        
        // deal with the sign
        let sign = chars.first == "-" ? -1 : 1
        if chars.first == "-" { chars.remove(at: 0) }

        var result: String = ""
        for char in chars {
            guard nums.contains(char) else { break }
            result.append(char)
        }
        
        var value = 0
        for (index, bit) in result.reverse.chars.enumerated() {
            value += Int(pow(Double(base), Double(index))) * nums.index(of: bit)!
        }
        return value * sign
    }
    
    /// An alias to `to_double` but returns `Float` instead.
    var to_f: Float {
        return to_double.to_f
    }
    
    /// Returns the result of interpreting leading characters in str as a double
    /// Extraneous characters past the end of a valid number are ignored.
    /// If there is not a valid number at the start of str, 0.0 is returned.
    var to_double: Double {
        var chars = self.chars
        
        // deal with the sign
        let sign: Double = chars.first == "-" ? -1.0 : 1.0
        if chars.first == "-" { chars.remove(at: 0) }
        
        var hasDot = false
        var integer: String = ""
        var decimal: String = ""
        for char in chars {
            if char == "." {
                if hasDot {
                    break
                } else {
                    hasDot = true
                    continue
                }
            }
            if integers.contains(char) {
                if hasDot {
                    decimal.append(char)
                } else {
                    integer.append(char)
                }
            } else {
                break
            }
        }
        
        if decimal.length > 0 {
            return (integer.to_i.to_double + decimal.to_i.to_double / pow(10.0, decimal.length.to_double)) * sign
        } else {
            return integer.to_i.to_double * sign
        }
    }
    
    /// Returns the result of interpreting the receiver in different standard.
    /// This methods returns `nil`, if the receiver is not in Custom, ISO8601, RFC2822 or CTime form.
    /// - SeeAlso: DateFormat
    var to_datetime: Date? {
        return Date(str: self)
    }
    
    /// Try to convert `self` to a `Regexp` which used to match string or pass as parameter
    /// into some methods.
    var to_regex: Regex {
        return Regex(self)
    }
}
