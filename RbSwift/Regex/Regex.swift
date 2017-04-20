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
    
    /// Invokes its `NSRegularExpression#firstMatch(in:options:range:)` method first to check it str is matched with
    /// current `regexp`. Returns `nil` if `NSRegularExpression#firstMatch(in:options:range:)` returns false, or this
    /// methods will encapsulates all the data inside a `MatchData` struct.
    ///
    ///     "[a-e]+".regex.match("hello") { data in
    ///         print(data.match)       #=> "e"
    ///     }
    ///
    ///     "[a-e]+".regex.match("hello") { data in
    ///         print(data.match)       #=> "e"
    ///     }
    ///
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    ///     "[a-e]+".regex.match("hello", 1) { data in
    ///         print(data.match)       #=> "e"
    ///         print(data.range)       #=> NSRange< loc: 1, length: 1 }>
    ///     }
    ///
    /// - Parameters:
    ///   - str: A string
    ///   - pos: The position in the string to begin the search
    ///   - closure: A closure invoked if there is a match
    /// - Returns: A `MatchData` instance contains all match results in it
    @discardableResult
    public func match(_ str: String, _ pos: Int = 0, closure: ((MatchData) -> Void)? = nil) -> MatchData? {
//        let str = str.bridge
        guard let result = regexp.firstMatch(in: str, options: [], range: NSMakeRange(pos, str.length - pos)) else { return nil }

        let match = str.bridge.substring(with: result.range)
        var captures: [String] = []
        var ranges: [NSRange] = []
        for index in 1..<result.numberOfRanges {
            let range = result.rangeAt(index)
            ranges.append(range)
            captures.append(str.bridge.substring(with: range))
        }
        let matchData = MatchData(match: match, range: result.range, captures: captures, ranges: ranges)
        if let closure = closure { closure(matchData) }
        return matchData
    }
    
    /// Invokes its `NSRegularExpression#matches(in:options:range:)` method to check it str is matched with
    /// current `regexp`. Returns `[]` if returns false, or this methods will encapsulates all
    /// the data inside a `MatchData` struct, and returns `[MatchData]`
    ///
    ///     "[aeiou]+".regex.scan("hello") { data in
    ///         print(data.match)       #=> e, o
    ///     }
    ///
    /// - Parameters:
    ///   - pattern: A string
    ///   - closure: A closure invoked if there is a match
    /// - Returns: An array of `MatchData` instance contains all match results in it
    @discardableResult
    public func scan(_ str: String, closure: ((MatchData) -> Void)? = nil) -> [MatchData] {
        let matches = regexp.matches(in: str, options: [], range: NSMakeRange(0, str.length))
        
        var matchDatas: [MatchData] = []
        for match in matches {
            let substr = str.bridge.substring(with: match.range)
            var datas: [String] = []
            var ranges: [NSRange] = []
            autoreleasepool {
                for index in 1..<match.numberOfRanges {
                    let range = match.rangeAt(index)
                    ranges.append(range)
                    datas.append(str.bridge.substring(with: range))
                }
            }
            let matchData = MatchData(match: substr, range: match.range, captures: datas, ranges: ranges)
            if let closure = closure { closure(matchData) }
            matchDatas.append(matchData)
        }
        return matchDatas
    }
    
    /// Invokes `NSRegularExpression#stringByReplacingMatches(in:options:range:withTemplate:)` method to replace original match
    /// result with template, $1, $2... are used to capture the match group in the str.
    ///
    ///     let str = "hello"
    /// 	"l".regex.replace(str, "abc")		#=> "heabcabco"
    /// 	"le".regex.replace(str, "lll")		#=> "hello"
    /// 	".".literal.replace(str, "lll")		#=> "hello"
    /// 	".".regex.replace(str, "lll")		#=> "lllllllllllllll"
    /// 	"^he".regex.replace(str, "lll")		#=> "lllllo"
    ///
    /// 	"\\b(?<!['’`])[a-z]".regex.replace("my name is draven", "a")		#=> "ay aame as araven"
    ///
    /// - Parameters:
    ///   - str: A string waiting for replacing
    ///   - template: A template string used to replace original str
    /// - Returns: A new string with all matching result replaced by template
    public func replace(_ str: String,  _ template: String) -> String {
        return regexp.stringByReplacingMatches(in: str, options: [], range: NSMakeRange(0, str.length), withTemplate: template)
    }
    
    /// Returns true if string is match with `Regex`
    ///
    ///     let regex = "hello".regex
    ///     if regex =~ "hello world" {
    ///         print("this will match")
    ///     }
    ///
    ///     if regex =~ "world" {
    ///         print("this won't match")
    ///     }
    ///
    /// - Parameters:
    ///   - regex: A Regex struct used to match the string
    ///   - str: A string waiting to match
    /// - Returns: A bool value indicates whether the str is matched with the Regexp
    public static func =~(regex: Regex, str: String) -> Bool {
        return regex.match(str) != nil
    }
    
    /// Returns true if string is match with `Regex`
    ///
    ///     let regex = "hello".regex
    ///     if "hello world" =~ regex {
    ///         print("this will match")
    ///     }
    ///
    ///     if "world" =~ regex {
    ///         print("this won't match")
    ///     }
    ///
    /// - Parameters:
    ///   - str: A string waiting to match
    ///   - regex: A Regex struct used to match the string
    /// - Returns: A bool value indicates whether the str is matched with the Regexp
    public static func =~(str: String, regex: Regex) -> Bool {
        return regex =~ str
    }
}
