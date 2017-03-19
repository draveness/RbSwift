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
    /// Converts pattern to a `NSRegularExpression`, then invokes its firstMatch(in:options:range:) method.
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - pos: A int specifies the position in the string to begin the search
    /// - Returns: A `MatchData` instance contains all match results in it
    func match(_ pattern: String, _ pos: Int = 0) -> MatchData? {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let str = self.substring(from: pos) as NSString
        guard let result = regex.firstMatch(in: str as String, options: [], range: NSMakeRange(0, self.length)) else { return nil }
        let match = str.substring(with: result.range)
        var datas: [String] = []
        var ranges: [NSRange] = []
        for index in 1..<result.numberOfRanges {
            let range = result.rangeAt(index)
            ranges.append(range)
            datas.append(str.substring(with: range))
        }
        return MatchData(match: match, range: result.range, datas: datas, ranges: ranges)
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its matches(in:options:range:) method.
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - pos: A int specifies the position in the string to begin the search
    /// - Returns: An array of `MatchData` instances contains all match results in it
    func matchAll(_ pattern: String, _ pos: Int = 0) -> [MatchData] {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let str = self.substring(from: pos) as NSString
        let matches = regex.matches(in: str as String, options: [], range: NSMakeRange(0, self.length))
        
        var matchDatas: [MatchData] = []
        for match in matches {
            let substr = str.substring(with: match.range)
            var datas: [String] = []
            var ranges: [NSRange] = []
            for index in 1..<match.numberOfRanges {
                let range = match.rangeAt(index)
                ranges.append(range)
                datas.append(str.substring(with: range))
            }
            let matchData = MatchData(match: substr, range: match.range, datas: datas, ranges: ranges)
            matchDatas.append(matchData)
        }
        return matchDatas
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its match(pattern:) method to get
    /// the `MatchData` and replace the first matchig result with passing str.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func sub(_ pattern: String, _ str: String) -> String {
        guard let matchData = match(pattern) else { return self }
        return (self as NSString).replacingCharacters(in: matchData.range, with: str)
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its match(pattern:) method to get
    /// the `MatchData` and replace the first matchig result with passing str, and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - str: A string to replace the matching substring
    mutating func subed(_ pattern: String, _ str: String) {
        self = sub(pattern, str)
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: String, _ str: String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.length), withTemplate: str)
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str, and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - str: A string to replace the matching substring
    mutating func gsubed(_ pattern: String, _ str: String) {
        self = gsub(pattern, str)
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace current string with the invokation
    /// of the closure.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: String, closure: (String) -> String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matchDatas = matchAll(pattern)
        var result: String = self
        for matchData in matchDatas.reversed() {
            result = regex.stringByReplacingMatches(in: result, options: [], range: NSMakeRange(0, self.length), withTemplate: closure(matchData.match))
        }
        return result as String
    }
    
    /// Converts pattern to a `NSRegularExpression`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace current string with the invokation
    /// of the closure , and eventually mutating itself.
    ///
    /// - Parameters:
    ///   - pattern: A string pattern
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    mutating func gsubed(_ pattern: String, closure: (String) -> String) {
        self = gsub(pattern, closure: closure)
    }
}
