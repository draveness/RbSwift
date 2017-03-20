//
//  SwiftPatch.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Remove
public extension String {
    /// Returns a new string with all occurrences of the patterns removed.
    ///
    /// - Parameter patterns: A string which will be converted to `NSRegularExpression`
    /// - Returns: A new string with all occurrences of the patterns removed
    func remove(_ patterns: String...) -> String {
        return remove(patterns)
    }
    
    /// Returns a new string with all occurrences of the patterns removed.
    ///
    /// - Parameter patterns: A string which will be converted to `NSRegularExpression`
    /// - Returns: A new string with all occurrences of the patterns removed
    func remove(_ patterns: [String]) -> String {
        var result = self
        patterns.forEach { result.gsubed($0, "") }
        return result
    }
    
    /// Returns the string, first removing all whitespace on both ends of the string, 
    /// and then changing remaining consecutive whitespace groups into one space each.
    var squish: String {
        return gsub("\\A[[:space:]]+", "")
            .gsub("[[:space:]]+\\z", "")
            .gsub("[[:space:]]+", " ")
    }
    
    /// Performs a destructive squish in place. See `squish`.
    mutating func squished() {
        self = gsub("\\A[[:space:]]+", "")
            .gsub("[[:space:]]+\\z", "")
            .gsub("[[:space:]]+", " ")
    }
    
    /// Returns a new string where runs of the same character that occur in this str
    /// are replaced by a single character. All runs of identical characters are 
    /// replaced by a single character.
    var squeeze: String {
        return chars.reduce("") { (result, char) in
            if result.last == char {
                return result
            } else {
                return result + char
            }
        }
    }
    
    /// Returns a new string where runs of the same character that occur in this str
    /// are replaced by a single character.
    ///
    /// - Parameter str: A str contains all characters need to squeeze
    /// - Returns: A new string with the same character squeezed
    func squeeze(_ str: String) -> String {
        return chars.reduce("") { (result, char) in
            if str.contains(char) && result.last == char {
                return result
            } else {
                return result + char
            }
        }
    }
    
    /// Squeezes str in place with returning nothing.
    ///
    /// - Parameter str: A str contains all characters need to squeeze
    mutating func squeezed(_ str: String) {
        self = squeeze(str)
    }
 
    /// Truncates the receiver string after a given length if string is longer 
    /// than length. The last characters will be replaced with the omission 
    /// string (defaults to "...") for a total length not exceeding length
    ///
    /// - Parameters:
    ///   - at: A interger indicates the length of truncated string must be less than
    ///   - omission: A string used to replace the last characters (defaults to "...")
    /// - Returns: A new string with length exceeding `at` characters removed
    func truncate(_ at: Int, omission: String = "...") -> String {
        if self.length <= omission.length { return self }
        if self.length <= at  { return self }
        return to(at - omission.length - 1)! + omission
    }
}
