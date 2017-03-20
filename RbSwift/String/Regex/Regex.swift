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
    private let regexp: NSRegularExpression

    /// Designated intializer for `Regexp` which encapsulates a `NSRegularExpression` instance inside.
    /// Converts the passed-in pattern to a `NSRegularExpression` inside.
    ///
    /// - Parameter pattern: A string pattern
    public init(_ pattern: String) {
        self.pattern = pattern
        self.regexp = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
    }
    
    /// Invokes its `firstMatch(in:options:range:)` method first to checkt it str is matched with
    /// current `regexp`. Returns `nil` if `firstMatch(in:options:range:)` returns false, or this 
    /// methods will encapsulates all the data inside a `MatchData` struct.
    ///
    /// - Parameters pattern: A string
    /// - Returns: A `MatchData` instance contains all match results in it
    func match(_ str: String) -> MatchData? {
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
