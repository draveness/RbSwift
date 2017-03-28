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
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36),
    /// default is 10, extraneous characters past the end of a valid number are ignored.
    ///
    /// 	"0a".to_i(16)           #=> 10
    /// 	"0xa".to_i(16)          #=> 0
    /// 	"12".to_i               #=> 12
    /// 	"-1100101".to_i(2)		#=> -101
    /// 	"1100101".to_i(2)		#=> 101
    /// 	"1100101".to_i(8)		#=> 294977
    /// 	"1100101".to_i(10)		#=> 1100101
    /// 	"1100101".to_i(16)		#=> 17826049
    ///
    /// This method returns 0 when base is invalid.
    ///
    /// 	"0a".to_i(1)            #=> 0
    /// 	"0a".to_i(37)           #=> 0
    ///
    /// If there is not a valid number at the start of str, 0 is returned.
    ///
    /// 	"-".to_i                #=> 0
    /// 	"d-1".to_i              #=> 0
    /// 	"0a".to_i               #=> 0
    /// 	"hello".to_i            #=> 0
    /// 	"".to_i                 #=> 0
    /// 	"  ".to_i               #=> 0
    ///
    var to_i: Int {
        return to_i(10)
    }
    
    /// Treats leading characters from str as a string of hexadecimal digits (with an optional sign and an optional 0x)
    /// and returns the corresponding number. Zero is returned on error.
    ///
    /// 	"-".to_hex          #=> 0
    /// 	"0xa".to_hex        #=> 10
    /// 	"-0xa".to_hex		#=> -10
    /// 	"a".to_hex          #=> 10
    ///
    var to_hex: Int {
        let sign = isStartWith("-") ? -1 : 1
        let str = isStartWith("-") ? self.substring(from: 1) : self
        guard str.isStartWith("0x") else { return str.to_i(16) * sign }
        return str.substring(from: 2).to_i(16) * sign
    }
    
    /// An alias to `String#to_hex` method.
    ///
    /// 	"-".hex         #=> 0
    /// 	"0xa".hex		#=> 10
    /// 	"-0xa".hex		#=> -10
    /// 	"a".hex         #=> 10
    ///
    var hex: Int {
        return to_hex
    }
    
    /// Treats leading characters of str as a string of octal digits (with an optional sign) 
    /// and returns the corresponding number.
    ///
    /// 	"123".oct           #=> 83
    /// 	"-377".oct          #=> -255
    /// 	"377bad".oct		#=> 255
    ///
    /// Returns 0 if the conversion fails.
    ///
    /// 	"bad".oct           #=> 0
    ///
    var oct: Int {
        return to_i(8)
    }
    
    /// Return the Integer ordinal of a one-character string.
    ///
    /// 	"a".ord         #=> 97
    /// 	"ab".ord        #=> 97
    /// 	"b".ord         #=> 98
    ///
    /// Return 0 if the receiver is an empty string.
    ///
    /// 	"".ord          #=> 0
    ///
    var ord: UInt32 {
        guard let first = self.unicodeScalars.first else { return 0 }
        return first.value
    }
    
    /// Returns the result of interpreting leading characters in str as an integer base (between 2 and 36),
    /// default is 10, extraneous characters past the end of a valid number are ignored.
    ///
    /// 	"0a".to_i(16)           #=> 10
    /// 	"0xa".to_i(16)          #=> 0
    /// 	"12".to_i               #=> 12
    /// 	"-1100101".to_i(2)		#=> -101
    /// 	"1100101".to_i(2)		#=> 101
    /// 	"1100101".to_i(8)		#=> 294977
    /// 	"1100101".to_i(10)		#=> 1100101
    /// 	"1100101".to_i(16)		#=> 17826049
    ///
    /// This method returns 0 when base is invalid.
    ///
    /// 	"0a".to_i(1)            #=> 0
    /// 	"0a".to_i(37)           #=> 0
    ///
    /// If there is not a valid number at the start of str, 0 is returned.
    ///
    /// 	"-".to_i                #=> 0
    /// 	"d-1".to_i              #=> 0
    /// 	"0a".to_i               #=> 0
    /// 	"hello".to_i            #=> 0
    /// 	"".to_i                 #=> 0
    /// 	"  ".to_i               #=> 0
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
    ///
    /// 	"0a".to_double              #=> 0
    /// 	"1100101.11".to_double		#=> 1100101.11
    /// 	"123.456".to_double         #=> 123.456
    /// 	"123.456ddddd".to_double    #=> 123.456
    /// 	".456ddddd".to_double		#=> 0.456
    ///
    /// If there is not a valid number at the start of str, 0.0 is returned.
    ///
    /// 	"-".to_double           #=> 0
    /// 	"d-1".to_double         #=> 0
    /// 	"0a".to_double          #=> 0
    /// 	"..12".to_double		#=> 0
    /// 	"hello".to_double		#=> 0
    ///
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
    ///
    ///     "Sun Mar 19 01:04:21 2017".to_datetime!         #=> 2017-03-19 01:04:21 +0000
    ///     "2017-03-19 00:35:36 +0800".to_datetime!        #=> 2017-03-19 00:35:36 +0800
    ///
    /// - See Also: DateFormat
    var to_datetime: Date? {
        return Date(str: self)
    }
}

extension String {
    /// Try to convert `self` to a `Regex` which used to match string or pass as parameter
    /// into some methods.
    public var to_regex: Regex {
        return to_regex()
    }
    
    /// Returns a `Regex` with matching string literally.
    public var literal: Regex {
        return to_regex(true)
    }

    /// Try to convert `self` to a `Regex` which used to match string or pass as parameter
    /// into some methods.
    ///
    /// - Parameter literal: A bool indicate whether match the receiver literally
    /// - Returns: A `Regex` struct contains the receiver as a pattern
    public func to_regex(_ literal: Bool = false) -> Regex {
        return Regex(self, literal: literal)
    }
}

extension Character {
    /// Try to convert `self` to a `Regex` which used to match string or pass as parameter
    /// into some methods.
    public var to_regex: Regex {
        return String(self).to_regex
    }
    
    /// Returns a `Regex` with matching character literally.
    public var literal: Regex {
        return String(self).literal
    }
}
