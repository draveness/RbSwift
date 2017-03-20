//
//  RegexSupport.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

infix operator =~

/// A Regexp holds a regular expression, used to match a pattern against strings.
/// Regexps are created using the `"xyz".regex` and by `init(pattern:)` constructor.
public struct Regex {
    /// Inside pattern which is immutable after initialization.
    public let pattern: String
    
    /// A regular expression converted from a pattern
    public let regexp: NSRegularExpression

    /// Designated intializer for `Regexp` which encapsulates a `NSRegularExpression` instance inside.
    /// Converts the passed-in pattern to a `NSRegularExpression` inside.
    ///
    /// - Parameter pattern: A string pattern
    /// - Parameter literal: A bool value indicates the `NSRegularExpression` matches a literal pattern
    public init(_ pattern: String, literal: Bool = false) {
        self.pattern = pattern
        let options: NSRegularExpression.Options = literal ? .ignoreMetacharacters : NSRegularExpression.Options(rawValue: 0)
        self.regexp = try! NSRegularExpression(pattern: pattern, options: options)
    }
    
    /// Invokes its `firstMatch(in:options:range:)` method first to check it str is matched with
    /// current `regexp`. Returns `nil` if `firstMatch(in:options:range:)` returns false, or this 
    /// methods will encapsulates all the data inside a `MatchData` struct.
    ///
    /// - Parameters pattern: A string
    /// - Returns: A `MatchData` instance contains all match results in it
    public func match(_ str: String) -> MatchData? {
        let str = str as NSString
        guard let result = regexp.firstMatch(in: str as String, options: [], range: NSMakeRange(0, str.length)) else { return nil }

        let match = str.substring(with: result.range)
        var captures: [String] = []
        var ranges: [NSRange] = []
        for index in 1..<result.numberOfRanges {
            let range = result.rangeAt(index)
            ranges.append(range)
            captures.append(str.substring(with: range))
        }
        return MatchData(match: match, range: result.range, captures: captures, ranges: ranges)
    }
    
    /// Invokes its `matches(in:options:range:)` method to check it str is matched with
    /// current `regexp`. Returns `[]` if returns false, or this methods will encapsulates all
    /// the data inside a `MatchData` struct, and returns `[MatchData]`
    ///
    /// - Parameters pattern: A string
    /// - Returns: An array of `MatchData` instance contains all match results in it
    public func scan(_ str: String) -> [MatchData] {
        let matches = regexp.matches(in: str, options: [], range: NSMakeRange(0, str.length))
        
        let str = str as NSString
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
            let matchData = MatchData(match: substr, range: match.range, captures: datas, ranges: ranges)
            matchDatas.append(matchData)
        }
        return matchDatas
    }
    
    /// Invokes `stringByReplacingMatches(in:options:range:withTemplate:)` method to replace original match
    /// result with template, $1, $2... are used to capture the match group in the str.
    ///
    /// - Parameters:
    ///   - str: A string waiting for replacing
    ///   - template: A template string used to replace original str
    /// - Returns: A new string with all matching result replaced by template
    public func replace(_ str: String, template: String) -> String {
        return regexp.stringByReplacingMatches(in: str, options: [], range: NSMakeRange(0, str.length), withTemplate: template)
    }
    
    /// Returns true if right string is match with left `Regexp`
    ///
    /// - Parameters:
    ///   - regex: A Regex struct used to match the string
    ///   - str: A string waiting to match
    /// - Returns: A bool value indicates whether the str is matched with the Regexp
    public static func =~(regex: Regex, str: String) -> Bool {
        return regex.match(str) != nil
    }
    
    /// Returns true if right string is match with left `Regexp`
    ///
    /// - Parameters:
    ///   - str: A string waiting to match
    ///   - regex: A Regex struct used to match the string
    /// - Returns: A bool value indicates whether the str is matched with the Regexp
    public static func =~(str: String, regex: Regex) -> Bool {
        return regex =~ str
    }
}
