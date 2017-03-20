//
//  Regex.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Regex
public extension String {
    /// Converts pattern to a `Regex`, then invokes its firstMatch(in:options:range:) method.
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - pos: A int specifies the position in the string to begin the search
    /// - Returns: A `MatchData` instance contains all match results in it
    func match(_ pattern: RegexConvertible, _ pos: Int = 0) -> MatchData? {
        let str = self.substring(from: pos)
        return pattern.regex.match(str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its scans(str:) method.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    /// - Returns: An array of `MatchData` instances contains all match results in it
    func scan(_ pattern: RegexConvertible, closure: ((String) -> Void)? = nil) -> [MatchData] {
        let results = pattern.regex.scan(self)
        if let closure = closure {
            results.forEach { closure($0.match) }
        }
        return results
    }
    
    /// Converts pattern to a `Regex`, then invokes its match(pattern:) method to get
    /// the `MatchData` and replace the first matchig result with passing str.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func sub(_ pattern: RegexConvertible, _ str: String) -> String {
        guard let matchData = match(pattern) else { return self }
        return (self as NSString).replacingCharacters(in: matchData.range, with: str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its match(pattern:) method to get
    /// the `MatchData` and replace the first matchig result with passing str, and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    mutating func subed(_ pattern: RegexConvertible, _ str: String) {
        self = sub(pattern, str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: RegexConvertible, _ str: String) -> String {
        return pattern.regex.regexp.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.length), withTemplate: str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str, and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    mutating func gsubed(_ pattern: RegexConvertible, _ str: String) {
        self = gsub(pattern, str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace current string with the invokation
    /// of the closure.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: RegexConvertible, closure: (String) -> String) -> String {
        let regex = pattern.regex
        let matchDatas = scan(regex)
        var result: String = self
        for matchData in matchDatas.reversed() {
            result = regex.regexp.stringByReplacingMatches(in: result, options: [], range: NSMakeRange(0, self.length), withTemplate: closure(matchData.match))
        }
        return result as String
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace current string with the invokation
    /// of the closure , and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    mutating func gsubed(_ pattern: RegexConvertible, closure: (String) -> String) {
        self = gsub(pattern, closure: closure)
    }
}
