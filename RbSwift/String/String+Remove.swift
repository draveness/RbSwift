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
    ///     let str = "foo bar test"
    ///
    /// 	str.remove(" test")             #=> "foo bar"
    /// 	str.remove(" test", "bar")		#=> "foo "
    /// 	str.remove(".")                 #=> ""
    /// 	str                             #=> "foo bar test"
    ///
    /// 	"returns a new string with all occurrences of the strs removed".remove("s") 
    ///         #=> "return a new tring with all occurrence of the tr removed"
    ///
    /// - Parameter patterns: An array of string which will be converted to `Regexp`
    /// - Returns: A new string with all occurrences of the patterns removed
    func remove(_ patterns: RegexConvertible...) -> String {
        return remove(patterns)
    }
    
    /// Returns a new string with all occurrences of the patterns removed.
    ///
    ///     let str = "foo bar test"
    ///
    /// 	str.remove(" test")             #=> "foo bar"
    /// 	str.remove(" test", "bar")		#=> "foo "
    /// 	str.remove(".")                 #=> ""
    /// 	str                             #=> "foo bar test"
    ///
    /// 	"returns a new string with all occurrences of the strs removed".remove("s")
    ///         #=> "return a new tring with all occurrence of the tr removed"
    ///
    /// - Parameter patterns: An array of string which will be converted to `Regexp`
    /// - Returns: A new string with all occurrences of the patterns removed
    func remove(_ patterns: [RegexConvertible]) -> String {
        var result = self
        patterns.forEach { result.gsubed($0, "") }
        return result
    }
    
    /// Returns the string, first removing all whitespace on both ends of the string, 
    /// and then changing remaining consecutive whitespace groups into one space each.
    ///
    /// 	"    Multi-line\n string ".squish               #=> "Multi-line string"
    /// 	" foo   bar    \n   \t   boo    ".squish		#=> "foo bar boo"
    ///
    var squish: String {
        return gsub("\\A[[:space:]]+", "")
            .gsub("[[:space:]]+\\z", "")
            .gsub("[[:space:]]+", " ")
    }
    
    /// Performs a destructive squish in place. See `squish`.
    ///
    ///     var lines = "    Multi-line\n string "
    /// 	lines.squished()        #=> "Multi-line string"
    ///     lines                   #=> "Multi-line string"
    ///
    /// - Returns: Self
    @discardableResult
    mutating func squished() -> String {
        self = squish
        return self
    }
    
    /// Returns a new string where runs of the same character that occur in this str
    /// are replaced by a single character. All runs of identical characters are 
    /// replaced by a single character.
    ///
    /// 	"yellow moon".squeeze                   #=> "yelow mon"
    /// 	"  now   is  the".squeeze(" ")          #=> " now is the"
    /// 	"putters shoot balls".squeeze("to")		#=> "puters shot balls"
    ///
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
    /// 	"yellow moon".squeeze                   #=> "yelow mon"
    /// 	"  now   is  the".squeeze(" ")          #=> " now is the"
    /// 	"putters shoot balls".squeeze("to")		#=> "puters shot balls"
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
    ///     var words = "yellow moon"
    /// 	words.squeeze()         #=> "yelow mon"
    /// 	words                   #=> "yelow mon"
    ///
    /// - Parameter str: A str contains all characters need to squeeze
    /// - Returns: Self
    @discardableResult
    mutating func squeezed(_ str: String) -> String {
        self = squeeze(str)
        return self
    }
 
    /// Truncates the receiver string after a given length if string is longer 
    /// than length. The last characters will be replaced with the omission 
    /// string (defaults to "...") for a total length not exceeding length
    ///
    ///     let str = "Once upon a time in a world far far away"
    /// 	str.truncate(27)		#=> "Once upon a time in a wo..."
    ///
    ///     let anotherStr = "And they found that many people were sleeping better."
    /// 	anotherStr.truncate(25, omission: "... (continued)")		#=> "And they f... (continued)"
    ///
    ///     let shortStr = "test"
    /// 	shortStr.truncate(3, omission: "... (continued)")           #=> "test"
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
