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
    /// Returns `true` if receiver contains the given strings or characters array.
    ///
    /// 	"  ".isInclude("he")                    #=> false
    /// 	"he".isInclude("he")                    #=> true
    /// 	"ohe".isInclude("he")                   #=> true
    /// 	"ohe".isInclude("he", "oooo")           #=> true
    /// 	"oe".isInclude("he", "dajkldjda")       #=> false
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string includes the other string
    func isInclude(_ substrings: String...) -> Bool {
        return isInclude(substrings)
    }

    /// Returns `true` if receiver contains the given strings or characters array.
    ///
    /// 	"  ".isInclude("he")                    #=> false
    /// 	"he".isInclude("he")                    #=> true
    /// 	"ohe".isInclude("he")                   #=> true
    /// 	"ohe".isInclude("he", "oooo")           #=> true
    /// 	"oe".isInclude("he", "dajkldjda")       #=> false
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string includes the other string
    func isInclude(_ substrings: [String]) -> Bool {
        return substrings.flatMap(contains).isAny { $0 == true }
    }
    
    /// Returns `true` if receiver does not contains the given strings or characters array.
    ///
    /// 	"  ".isExlude("he")                     #=> true
    /// 	"he".isExlude("he")                     #=> false
    /// 	"ohe".isExlude("he")                    #=> false
    /// 	"ohe".isExlude("he", "oooo")            #=> false
    /// 	"oe".isExlude("he", "dajkldjda")		#=> true
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string excludes the other string
    func isExlude(_ substrings: String...) -> Bool {
        return isExlude(substrings)
    }
    
    /// Returns `true` if receiver does not contains the given strings or characters array.
    ///
    /// 	"  ".isExlude("he")                     #=> true
    /// 	"he".isExlude("he")                     #=> false
    /// 	"ohe".isExlude("he")                    #=> false
    /// 	"ohe".isExlude("he", "oooo")            #=> false
    /// 	"oe".isExlude("he", "dajkldjda")		#=> true
    ///
    /// - Parameter substrings: An array of strings or characters
    /// - Returns: A bool value indicates whether the string excludes the other string
    func isExlude(_ substrings: [String]) -> Bool {
        return substrings.flatMap(contains).isAll { $0 == false }
    }
    
    /// Returns true if str starts with one of the prefixes given.
    ///
    /// 	"he".isStartWith("he")                  #=> true
    /// 	"ohe".isStartWith("he", "oooo")         #=> false
    /// 	"oe".isStartWith("o", "dajkldjda")		#=> true
    ///
    /// - Parameter substrings: An array of prefixes
    /// - Returns: A bool value indicates whether the string starts with another string in array
    func isStartWith(_ substrings: String...) -> Bool {
        return isStartWith(substrings)
    }

    /// Returns true if str starts with one of the prefixes given.
    ///
    /// 	"he".isStartWith("he")                  #=> true
    /// 	"ohe".isStartWith("he", "oooo")         #=> false
    /// 	"oe".isStartWith("o", "dajkldjda")		#=> true
    ///
    /// - Parameter substrings: An array of prefixes
    /// - Returns: A bool value indicates whether the string starts with another string in array
    func isStartWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(hasPrefix).isAny { $0 == true }
    }
    
    /// Returns true if str ends with one of the suffixes given.
    ///
    /// 	"  ".isEndWith("he")                    #=> false
    /// 	"he".isEndWith("he")                    #=> true
    /// 	"ohe".isEndWith("he")                   #=> true
    /// 	"ohe".isEndWith("he", "oooo")           #=> true
    /// 	"oe".isEndWith("he", "dajkldjda")		#=> false
    ///
    /// - Parameter substrings: An array of suffixes
    /// - Returns: A bool value indicates whether the string ends with another string in array
    func isEndWith(_ substrings: String...) -> Bool {
        return isEndWith(substrings)
    }
    
    /// Returns true if str ends with one of the suffixes given.
    ///
    /// 	"  ".isEndWith("he")                    #=> false
    /// 	"he".isEndWith("he")                    #=> true
    /// 	"ohe".isEndWith("he")                   #=> true
    /// 	"ohe".isEndWith("he", "oooo")           #=> true
    /// 	"oe".isEndWith("he", "dajkldjda")		#=> false
    ///
    /// - Parameter substrings: An array of suffixes
    /// - Returns: A bool value indicates whether the string ends with another string in array
    func isEndWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(hasSuffix).isAny { $0 == true }
    }
    
    /// Converts pattern to a `NSReguarExpression`, then returns a bool value indicates whether
    /// the `NSReguarExpression` is matched receiver or not. 
    ///
    /// 	"  ".isMatch("he")              #=> false
    /// 	"he".isMatch("he")              #=> true
    /// 	"oe".isMatch("he")              #=> false
    /// 	"oe".isMatch(".e")              #=> true
    /// 	"abcdefghijklmnopqrstuvwxyz".isMatch(".*")		#=> true
    ///
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    /// 	"ohe".isMatch("he", 2)          #=> false
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
    ///
    /// 	"  ".isBlank            #=> true
    /// 	"\t\n\r\n".isBlank		#=> true
    /// 	"\t\nblah".isBlank		#=> false
    ///
    var isBlank: Bool {
        return self.chars.reduce(true) { $0 && ($1 =~ "[\r\n\t ]".to_regex) }
    }
    
    /// Returns true is the recevier string's characters are all downcase.
    ///
    /// 	"HELLO".isDowncase		#=> false
    /// 	"HELLOo".isDowncase		#=> false
    /// 	"hello".isDowncase		#=> true
    ///
    var isDowncase: Bool {
        return self.downcase == self
    }
    
    /// Returns true is the recevier string's characters are all upcase.
    ///
    /// 	"HELLO".isUpcase		#=> true
    /// 	"HELLOo".isUpcase		#=> false
    ///
    var isUpcase: Bool {
        return self.upcase == self
    }
}
