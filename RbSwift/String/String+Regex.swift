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
    /// Converts pattern to a `Regex`, then invokes its `Regex#match(str:)` method.
    /// If the second parameter is present, it specifies the position in the string to begin the search.
    ///
    ///     let matchData = "hello".match("(.)ll(o)")!  #=> <MatchData>
    /// 	matchData.match                             #=> "ello"
    /// 	matchData.captures[0]                       #=> "e"
    /// 	matchData.captures[1]                       #=> "o"
    ///
    ///     let matchData = "hello".match("aha")        #=> nil
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - pos: A int specifies the position in the string to begin the search
    /// - Returns: A `MatchData` instance contains all match results in it
    func match(_ pattern: RegexConvertible, _ pos: Int = 0) -> MatchData? {
        let str = self.substring(from: pos)
        return pattern.regex.match(str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its `Regex#scans(str:)` method which returns
    /// an sequence of `MatchData`.
    ///
    ///     let str = "abcxxabcxxsbc"
    ///     let scanResults = str.scan("(.)bc")
    /// 	scanResults[0].to_a		#=> ["abc", "a"]
    /// 	scanResults[1].to_a		#=> ["abc", "a"]
    /// 	scanResults[2].to_a		#=> ["sbc", "s"]
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
    /// 	"hello".sub("l", "abc")         #=> "heabclo"
    /// 	"hello".sub("le", "lll")		#=> "hello"
    /// 	"hello".sub(".", "a")           #=> "aello"
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func sub(_ pattern: RegexConvertible, _ str: String) -> String {
        guard let matchData = match(pattern.regex) else { return self }
        return self.bridge.replacingCharacters(in: matchData.range, with: str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its match(pattern:) method to get
    /// the `MatchData` and replace the first matchig result with passing str, and eventually mutating itself.
    ///
    ///     var hello = "hello"
    ///     hello.subed("l", "abc")     #=> "heabclo"
    /// 	hello                       #=> "heabclo"
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: Self
    @discardableResult
    mutating func subed(_ pattern: RegexConvertible, _ str: String) -> String {
        self = sub(pattern, str)
        return self
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str.
    ///
    /// 	"hello".gsub("l", "abc")                #=> "heabcabco"
    /// 	"hello".gsub("le", "lll")               #=> "hello"
    /// 	"hello".gsub(".".literal, "lll")        #=> "hello"
    /// 	"hello".gsub(".", "lll")                #=> "lll" * 5
    /// 	"hello".gsub("^he", "lll")              #=> "lllllo"
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: RegexConvertible, _ str: String) -> String {
        return pattern.regex.replace(self, str)
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and replace the all matchig result with passing str, and eventually mutating itself.
    ///
    ///     var hello = "hello"
    ///     hello.gsubed("l", "abc")        #=> "heabcabco"
    /// 	hello                           #=> "heabcabco"
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - str: A string to replace the matching substring
    /// - Returns: Self
    @discardableResult
    mutating func gsubed(_ pattern: RegexConvertible, _ str: String) -> String {
        self = gsub(pattern, str)
        return self
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace 
    /// current string with the invocation of the closure.
    ///
    /// 	let result = "my name is draven".gsub("\\b(?<!['’`])[a-z]") { _ in
    ///         return "a"
    ///     }
    ///     result      #=> "ay aame as araven"
    ///
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    /// - Returns: A new string with str replacing the matched result
    func gsub(_ pattern: RegexConvertible, closure: (String) -> String) -> String {
        let regex = pattern.regex
        var result: String = self
        for matchData in scan(regex).reversed() {
            result = regex.replace(result, closure(matchData.match))
        }
        return result.bridge
    }
    
    /// Converts pattern to a `Regex`, then invokes its matchAll(pattern:) method to get
    /// the `MatchData` array and invoke the closure with all matchig result and replace current string with the invokation
    /// of the closure , and eventually mutating itself.
    ///
    ///     var intro = "my name is draven"
    /// 	intro.gsubed("\\b(?<!['’`])[a-z]") { _ in
    ///         return "a"
    ///     }           #=> "ay aame as araven"
    ///     intro       #=> "ay aame as araven"
    /// - Parameters:
    ///   - pattern: A pattern conforms to `RegexConvertible`
    ///   - closure: A closure accepts the matching result as input and return output to change the origianl string
    @discardableResult
    mutating func gsubed(_ pattern: RegexConvertible, closure: (String) -> String) -> String {
        self = gsub(pattern, closure: closure)
        return self
    }
}
