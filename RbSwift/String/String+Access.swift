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
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    /// Returns nil if the initial offset falls outside the string.
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    /// - Parameter pos: A specific position in the receiver string
    /// - Returns: A substring of one character at that position or nil
    func at(_ pos: Int) -> String? {
        if pos >= length { return nil }
        return self.split("")[pos]
    }
    
    
    /// If you pass a single `Int`, returns a substring of one character at that position.
    /// The first character of the string is at position 0, the next at position 1, and so on.
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    /// Returns nil if the initial offset falls outside the string.
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    /// - Parameter range: A range used to substring the receiver
    /// - Returns: A substring containing characters at offsets given by the range is returned
    func at(_ range: CountableClosedRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound > length - 1 ? length - 1 : range.upperBound
        return self.split("")[range.lowerBound...upperBound].joined()
    }
    
    /// If you pass a single `Int`, returns a substring of one character at that position.
    /// The first character of the string is at position 0, the next at position 1, and so on.
    /// If a `Range` is supplied, a substring containing characters at offsets given by the range is returned.
    /// Returns nil if the initial offset falls outside the string.
    /// Returns an empty string if the beginning of the range is greater than the end of the string.
    ///
    /// - Parameter range: A range used to substring the receiver
    /// - Returns: A substring containing characters at offsets given by the range is returned
    func at(_ range: CountableRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound >= length ? length : range.upperBound
        return self.split("")[range.lowerBound..<upperBound].joined()
    }
    
    /// Returns the first character as `String`.
    var first: String {
        return first(1)
    }
    
    /// Returns the first character as `String`.
    /// An alias method for `first`.
    var chr: String {
        return first
    }
    
    /// Returns the first character as `String`.
    /// If a limit is supplied, returns a substring from the beginning of the string until it reaches the limit value. 
    /// If the given limit is greater than or equal to the string length, returns a copy of self.
    /// If the given limit is less than the string length, returns a empty string.
    ///
    /// - Parameter limit: A integer indicates how many characters would extract from the receiver
    /// - Returns: A substring containing characters from the beginning to given `num`
    func first(_ limit: Int = 1) -> String {
        if limit <= 0 { return "" }
        if limit >= self.length { return self }
        return split("")[0..<limit].joined()
    }
    
    /// Returns the last character of the reveiver of `String`.
    var last: String {
        return last(1)
    }
    
    /// Returns the last character of the reveiver of `String`.
    /// If a limit is supplied, returns a substring from the end of the string until it reaches the limit value (counting backwards). 
    /// If the given limit is greater than or equal to the string length, returns a copy of self.
    /// If the given limit is less than the string length, returns a empty string.
    ///
    /// - Parameter limit: A integer indicates how many characters would extract from the receiver
    /// - Returns: A substring containing characters from the end of the string until it reaches the limit value (counting backwards)
    func last(_ limit: Int = 1) -> String {
        if limit <= 0 { return "" }
        if limit >= self.length { return self }
        return split("")[self.length-limit..<self.length].joined()
    }
    
    /// Returns a substring from the given position to the end of the string. 
    /// If the position is negative, it is counted from the end of the string.
    ///
    /// - Parameter num: A position indicates the start position of substring
    /// - Returns: A substring from the given position to the end of the string
    func from(_ num: Int) -> String? {
        guard num < self.length && num > -self.length else { return "" }
        let num = (0..<self.length).contains(num) ? num : self.length + num
        return substring(from: num)
    }
    
    /// Returns a substring from the beginning of the string to the given position(**included**).
    /// If the position is negative, it is counted from the end of the string.
    ///
    /// - Parameter num: A position indicates the end position of substring
    /// - Returns: A substring from the beginning of the string to the given position
    func to(_ num: Int) -> String? {
        if num >= self.length { return self }
        if num <= -self.length { return "" }
        let num = (0..<self.length).contains(num) ? num + 1 : self.length + num + 1
        return substring(to: num)
    }
    
    
    /// Returns a substring from the given position to the end of the string.
    /// Uses `NSString` method substring(from:) to get a substring from the receiver.
    ///
    /// - Parameter from: A position indicates the start position of substring
    /// - Returns: A substring from the given position to the end of the string
    func substring(from: Int) -> String {
        return (self as NSString).substring(from: from)
    }
    
    /// Returns a substring from the beginning of the string to the given position(**excluded**).
    /// Uses `NSString` method substring(to:) to get a substring from the receiver.
    ///
    /// - Parameter to: A position indicates the end position of substring
    /// - Returns: A substring from the beginning of the string to the given position
    func substring(to: Int) -> String {
        return (self as NSString).substring(to: to)
    }
    
    /// Returns the index of the first occurrence of the given substring in str. 
    /// Returns `nil` if not found.
    ///
    /// - Parameter str: A substring used to find index in the receiver
    /// - Returns: The index of the first occurrence of the given substring in str or `nil`
    func index(_ str: String) -> Int? {
        guard let data = matchAll(str).first else { return nil }
        return data.range.location
    }
    
    /// Returns the index of the last occurrence of the given substring in str.
    /// Returns `nil` if not found.
    ///
    /// - Parameter str: A substring used to find rindex in the receiver
    /// - Returns: The index of the last occurrence of the given substring in str or `nil`
    func rindex(_ str: String) -> Int? {
        guard let data = matchAll(str).last else { return nil }
        return data.range.location
    }
}
