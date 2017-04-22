//
//  String+Access.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Access
public extension String {
    /// If you pass a single `Int`, returns a substring of one character at that position.
    /// The first character of the string is at position 0, the next at position 1, and so on.
    ///
    ///     "Hello".at(1)        #=> "e"
    ///     "Hello".at(2)        #=> "l"
    ///     "Hello".at(4)        #=> "o"
    ///     "Hello".at(5)        #=> nil
    ///     "Hello".at(10)       #=> nil
    ///
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    ///
    ///     "Hello".at(1...2)       #=> "el"
    ///     "Hello".at(1...4)       #=> "ello"
    ///     "Hello".at(1...5)       #=> "ello"
    ///     "Hello".at(4...9)       #=> "o"
    ///
    ///     "Hello".at(1..<2)       #=> "e"
    ///     "Hello".at(1..<4)       #=> "ell"
    ///     "Hello".at(1..<5)       #=> "ello"
    ///     "Hello".at(1..<6)       #=> "ello"
    ///
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    ///     "Hello".at(5...9)       #=> ""
    ///     "Hello".at(5..<9)       #=> ""
    ///
    /// Returns `nil` if the initial offset falls outside the string.
    ///
    ///     "Hello".at(6...9)       #=> nil
    ///     "Hello".at(6..<9)       #=> nil
    ///
    /// - Parameter pos: A specific position in the receiver string
    /// - Returns: A substring of one character at that position or nil
    func at(_ pos: Int) -> String? {
        if pos >= length { return nil }
        return self.chars[pos]
    }
    
    
    /// If you pass a single `Int`, returns a substring of one character at that position.
    /// The first character of the string is at position 0, the next at position 1, and so on.
    ///
    ///     "Hello".at(1)        #=> "e"
    ///     "Hello".at(2)        #=> "l"
    ///     "Hello".at(4)        #=> "o"
    ///     "Hello".at(5)        #=> nil
    ///     "Hello".at(10)       #=> nil
    ///
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    ///
    ///     "Hello".at(1...2)       #=> "el"
    ///     "Hello".at(1...4)       #=> "ello"
    ///     "Hello".at(1...5)       #=> "ello"
    ///     "Hello".at(4...9)       #=> "o"
    ///
    ///     "Hello".at(1..<2)       #=> "e"
    ///     "Hello".at(1..<4)       #=> "ell"
    ///     "Hello".at(1..<5)       #=> "ello"
    ///     "Hello".at(1..<6)       #=> "ello"
    ///
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    ///     "Hello".at(5...9)       #=> ""
    ///     "Hello".at(5..<9)       #=> ""
    ///
    /// Returns `nil` if the initial offset falls outside the string.
    ///
    ///     "Hello".at(6...9)       #=> nil
    ///     "Hello".at(6..<9)       #=> nil
    ///
    /// - Parameter range: A range used to substring the receiver
    /// - Returns: A substring containing characters at offsets given by the range is returned
    func at(_ range: CountableClosedRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound > length - 1 ? length - 1 : range.upperBound
        return self.chars[range.lowerBound...upperBound].joined()
    }
    
    /// If you pass a single `Int`, returns a substring of one character at that position.
    /// The first character of the string is at position 0, the next at position 1, and so on.
    ///
    ///     "Hello".at(1)        #=> "e"
    ///     "Hello".at(2)        #=> "l"
    ///     "Hello".at(4)        #=> "o"
    ///     "Hello".at(5)        #=> nil
    ///     "Hello".at(10)       #=> nil
    ///
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    ///
    ///     "Hello".at(1...2)       #=> "el"
    ///     "Hello".at(1...4)       #=> "ello"
    ///     "Hello".at(1...5)       #=> "ello"
    ///     "Hello".at(4...9)       #=> "o"
    ///
    ///     "Hello".at(1..<2)       #=> "e"
    ///     "Hello".at(1..<4)       #=> "ell"
    ///     "Hello".at(1..<5)       #=> "ello"
    ///     "Hello".at(1..<6)       #=> "ello"
    ///
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    ///     "Hello".at(5...9)       #=> ""
    ///     "Hello".at(5..<9)       #=> ""
    ///
    /// Returns `nil` if the initial offset falls outside the string.
    ///
    ///     "Hello".at(6...9)       #=> nil
    ///     "Hello".at(6..<9)       #=> nil
    ///
    /// - Parameter range: A range used to substring the receiver
    /// - Returns: A substring containing characters at offsets given by the range is returned
    func at(_ range: CountableRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound >= length ? length : range.upperBound
        return self.chars[range.lowerBound..<upperBound].joined()
    }
    
    /// Returns the first character as `String`.
    ///
    ///     "hello".first       #=> "h"
    ///     "".first            #=> ""
    ///
    var first: String {
        return first(1)
    }
    
    /// Returns the first character as `String`.
    /// An alias method for `String#first`.
    ///
    ///     "hello".chr         #=> "h"
    ///     "".chr              #=> ""
    ///
    var chr: String {
        return first
    }
    
    /// Returns the first character as `String`.
    ///
    ///     let str = "people"
    ///     str.first           #=> "p"
    ///     str.first()         #=> "p"
    ///
    /// If a limit is supplied, returns a substring from the beginning of the string until it reaches the limit value.
    ///
    ///     str.first(1)        #=> "p"
    ///     str.first(2)        #=> "pe"
    ///     str.first(4)        #=> "peop"
    ///
    /// If the given limit is greater than or equal to the string length, returns a copy of self.
    ///
    ///     str.first(50)        #=> "people"
    ///
    /// If the given limit is less than the string length, returns a empty string.
    ///
    ///     str.first(0)        #=> ""
    ///     str.first(-2)       #=> ""
    ///
    /// - Parameter limit: A integer indicates how many characters would extract from the receiver
    /// - Returns: A substring containing characters from the beginning to given `num`
    func first(_ limit: Int = 1) -> String {
        if limit <= 0 { return "" }
        if limit >= self.length { return self }
        return chars[0..<limit].joined()
    }
    
    /// Returns the last character of the reveiver of `String`.
    ///
    ///     "hello".last       #=> "o"
    ///     "".last            #=> ""
    ///
    var last: String {
        return last(1)
    }
    
    /// Returns the last character of the reveiver of `String`.
    ///
    ///     let str = "people"
    ///     str.last            #=> "e"
    ///     str.last()          #=> "e"
    ///
    /// If a limit is supplied, returns a substring from the end of the string until it reaches the limit value (counting backwards).
    ///
    ///     str.last(1)         #=> "e"
    ///     str.last(2)         #=> "le"
    ///     str.last(4)         #=> "ople"
    ///
    /// If the given limit is greater than or equal to the string length, returns a copy of self.
    ///
    ///     str.last(50)        #=> "people"
    ///
    /// If the given limit is less than the string length, returns a empty string.
    ///
    ///     str.last(0)         #=> ""
    ///     str.last(-2)        #=> ""
    ///
    /// - Parameter limit: A integer indicates how many characters would extract from the receiver
    /// - Returns: A substring containing characters from the end of the string until it reaches the limit value (counting backwards)
    func last(_ limit: Int = 1) -> String {
        if limit <= 0 { return "" }
        if limit >= self.length { return self }
        return chars[self.length-limit..<self.length].joined()
    }
    
    /// Returns a substring from the given position to the end of the string. 
    ///
    ///     let str = "hello"
    /// 	str.from(0)         #=> "hello"
    /// 	str.from(3)         #=> "lo"
    /// 	str.from(5)         #=> ""
    ///
    /// If the position is negative, it is counted from the end of the string.
    ///
    /// 	str.from(-5)		#=> ""
    /// 	str.from(-6)		#=> ""
    /// 	str.from(-2)		#=> "lo"
    /// 	str.from(-1)		#=> "o"
    /// 	str.from(-2)		#=> "lo"
    ///
    /// - Parameter num: A position indicates the start position of substring
    /// - Returns: A substring from the given position to the end of the string
    func from(_ num: Int) -> String? {
        guard num < self.length && num > -self.length else { return "" }
        let num = (0..<self.length).contains(num) ? num : self.length + num
        return substring(from: num)
    }
    
    /// Returns a substring from the beginning of the string to the given position(**included**).
    ///
    ///     let str = "hello"
    /// 	str.to(0)       #=> "h"
    /// 	str.to(3)		#=> "hell"
    /// 	str.to(4)		#=> "hello"
    /// 	str.to(5)		#=> "hello"
    ///
    /// If the position is negative, it is counted from the end of the string.
    ///
    /// 	str.to(-2)		#=> "hell"
    /// 	str.to(-6)		#=> ""
    /// 	str.to(-7)		#=> ""
    ///
    /// - Parameter num: A position indicates the end position of substring
    /// - Returns: A substring from the beginning of the string to the given position
    func to(_ num: Int) -> String? {
        if num >= self.length { return self }
        if num <= -self.length { return "" }
        let num = (0..<self.length).contains(num) ? num + 1 : self.length + num + 1
        return substring(to: num)
    }
    
    /// Returns a substring in the range with from...to, both sides included.
    ///
    ///     let str = "hello"
    /// 	str.range(0, 0)         #=> "h"
    /// 	str.range(0, 1)         #=> "he"
    /// 	str.range(0, 10)		#=> "hello"
    /// 	str.range(3, 10)		#=> "lo"
    ///
    /// - Parameters:
    ///   - from: A position indicates the start position of substring
    ///   - to: A position indicates the end position of substring
    /// - Returns: A substring within the range of the string to the given position
    func range(_ from: Int, _ to: Int) -> String? {
        guard let result = self.to(to)?.from(from) else { return nil }
        return result
    }
    
    /// Returns a substring from the given position to the end of the string.
    /// Uses `NSString` method substring(from:) to get a substring from the receiver.
    ///
    ///     let str = "hello"
    /// 	"Hello".substring(from: 1)		#=> "ello"
    /// 	"H\n11".substring(from: 2)		#=> "11"
    ///
    /// - Parameter from: A position indicates the start position of substring
    /// - Returns: A substring from the given position to the end of the string
    func substring(from: Int) -> String {
        return self.bridge.substring(from: from)
    }
    
    /// Returns a substring from the beginning of the string to the given position(**excluded**).
    /// Uses `NSString` method substring(to:) to get a substring from the receiver.
    ///
    ///     let str = "hello"
    /// 	"Hello".substring(to: 1)		#=> "H"
    /// 	"H\n11".substring(to: 2)		#=> "H\n"
    ///
    /// - Parameter to: A position indicates the end position of substring
    /// - Returns: A substring from the beginning of the string to the given position
    func substring(to: Int) -> String {
        return self.bridge.substring(to: to)
    }
    
    /// Returns the index of the first occurrence of the given substring in str.
    /// Returns `nil` if not found.
    ///
    /// 	"hello".index("e")		#=> 1
    /// 	"hello".index("l")		#=> 2
    /// 	"hello".index("a")      #=> nil
    ///
    /// - Parameter str: A substring used to find index in the receiver
    /// - Returns: The index of the first occurrence of the given substring in str or `nil`
    func index(_ str: String) -> Int? {
        guard let data = scan(str).first else { return nil }
        return data.range.location
    }
    
    /// Returns the index of the last occurrence of the given substring in str.
    /// Returns `nil` if not found.
    ///
    /// 	"hello".rindex("e")		#=> 1
    /// 	"hello".rindex("l")		#=> 3
    /// 	"hello".rindex("x")		#=> nil
    ///
    /// - Parameter str: A substring used to find rindex in the receiver
    /// - Returns: The index of the last occurrence of the given substring in str or `nil`
    func rindex(_ str: String) -> Int? {
        guard let data = scan(str).last else { return nil }
        return data.range.location
    }
}
