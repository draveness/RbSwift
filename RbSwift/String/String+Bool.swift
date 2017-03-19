//
//  Exclude.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension String {
    /// Returns `true` if receiver contains the given string or character.
    ///
    /// - Parameter substring: Another string
    /// - Returns: A bool value indicates whether the string includes the other string
    func isInclude(_ substring: String) -> Bool {
        return contains(substring)
    }
    
    /// Returns `true` if receiver contains the given strings or characters array.
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string includes the other string
    func isInclude(_ substrings: String...) -> Bool {
        return isInclude(substrings)
    }

    /// Returns `true` if receiver contains the given strings or characters array.
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string includes the other string
    func isInclude(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isInclude).isAny(obj: true)
    }
    
    /// The inverse of `isInclude`. Returns `true` if the receiver does not include the other string.
    ///
    /// - Parameter substring: Another string
    /// - Returns: A bool value indicates whether the string excludes the other string
    func isExlude(_ substring: String) -> Bool {
        return !isInclude(substring)
    }
    
    /// Returns `true` if receiver does not contains the given strings or characters array.
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string excludes the other string
    func isExlude(_ substrings: String...) -> Bool {
        return isExlude(substrings)
    }
    
    /// Returns `true` if receiver does not contains the given strings or characters array.
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string excludes the other string
    func isExlude(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isExlude).isAll(obj: true)
    }
    
    /// Returns true if str starts with the prefix given.
    ///
    /// - Parameter substring: A prefix string
    /// - Returns: A bool value indicates whether the string starts with another string
    func isStartWith(_ substring: String) -> Bool {
        return hasPrefix(substring)
    }
    
    /// Returns true if str starts with one of the prefixes given.
    ///
    /// - Parameter substrings: An array of prefixes
    /// - Returns: A bool value indicates whether the string starts with another string in array
    func isStartWith(_ substrings: String...) -> Bool {
        return isStartWith(substrings)
    }

    /// Returns true if str starts with one of the prefixes given.
    ///
    /// - Parameter substrings: An array of prefixes
    /// - Returns: A bool value indicates whether the string starts with another string in array
    func isStartWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isStartWith).isAny(obj: true)
    }
    
    /// Returns true if str ends with the suffix given.
    ///
    /// - Parameter substring: A suffix string
    /// - Returns: A bool value indicates whether the string ends with another string
    func isEndWith(_ substring: String) -> Bool {
        return hasSuffix(substring)
    }
    
    /// Returns true if str ends with one of the suffixes given.
    ///
    /// - Parameter substrings: An array of suffixes
    /// - Returns: A bool value indicates whether the string ends with another string in array
    func isEndWith(_ substrings: String...) -> Bool {
        return isEndWith(substrings)
    }
    
    /// Returns true if str ends with one of the suffixes given.
    ///
    /// - Parameter substrings: An array of suffixes
    /// - Returns: A bool value indicates whether the string ends with another string in array
    func isEndWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isEndWith).isAny(obj: true)
    }
    
    /// Converts pattern to a `NSReguarExpression`, then returns a true or false indicates whether 
    /// the `NSReguarExpression` is matched receiver or not. 
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - start: A int specifies the position in the string to begin the search
    /// - Returns: a true or false indicates whether the `NSReguarExpression` is matched receiver or not
    func isMatch(_ pattern: String, _ start: Int = 0) -> Bool {
        let str = substring(from: start)
        if let _ = str.match(pattern) { return true }
        return false
    }

    /// Returns true is the recevier string's characters are all whitespaces, like `\r`, `\n`, `\t` and ` `.
    var isBlank: Bool {
        return self.split("").reduce(true) { $0 && ($1 =~ "[\r\n\t ]") }
    }
    
    /// Returns true is the recevier string's characters are all downcase.
    var isDowncase: Bool {
        return self.downcase == self
    }
    
    /// Returns true is the recevier string's characters are all upcase.
    var isUpcase: Bool {
        return self.upcase == self
    }
}
