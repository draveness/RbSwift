//
//  Transform.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    /// Returns a new String with the \n, \r, and \r\n removed from the end of str,
    var chomp: String {
        guard self.length > 0 else { return "" }
        var result = self
        while result.length > 0 {
            if let lastChar = result.characters.last {
                if lastChar == "\n" || lastChar == "\r" ||
                    lastChar == " " || lastChar == "\t" || lastChar == "\r\n" {
                    result = result.chop
                    print(result)
                } else {
                    break
                }
            }
        }
        return result
    }
    
    /// Returns a new String with the seaprator removed from the end of str (if present).
    /// If separator is an empty string, it will remove all trailing newlines from the string.
    ///
    /// - Parameter separator: A string used to chomp from the end of the string
    /// - Returns: A new string with the end of str being chomped from the receiver
    func chomp(_ separator: String = "") -> String {
        guard self.length > 0 else { return "" }
        guard separator.length > 0 else {
            var result = self
            while result.length > 0 {
                if let lastChar = result.characters.last {
                    if lastChar == "\r\n" {
                        result = result.chop
                    } else {
                        break
                    }
                }
            }
            return result
        }
        guard hasSuffix(separator) else { return self }
        let substring = self.substring(to: self.length - separator.length)
        return substring
    }
    
    /// Modifies str in place as described for .chomp(separator:), returning str.
    ///
    /// - Parameter separator: A string used to chomp from the end of the string
    /// - Returns: Self
    @discardableResult mutating func chomped(_ separator: String = "") -> String {
        self = chomp(separator)
        return self
    }
    
    /// Return a new string with the last char removed from the receiver
    /// This methods will return a empty string if the receiver length is less than or
    /// equal to 0.
    var chop: String {
        guard self.length > 0 else { return "" }
        var result = self
        result.remove(at: result.index(before: result.endIndex))
        return result
    }
    
    /// Modifies str in place as described for .chop, returning str.
    ///
    /// - Returns: Self
    @discardableResult mutating func choped() -> String {
        self = chop
        return self
    }
    
    /// Makes string empty.
    ///
    /// - Returns: A empty string
    @discardableResult mutating func cleared() -> String {
        self = ""
        return self
    }
    
    /// Reverses all characters in the string.
    var reverse: String {
        return String(self.characters.reversed())
    }
    
    /// Modifies str in place as described for .reverse, returning str.
    ///
    /// - Returns: Self
    @discardableResult mutating func reversed() -> String {
        self = reverse
        return self
    }
    
    /// Divides str into substrings based on a delimiter, returning an array of these substrings.
    var split: [String] {
        return split(" ")
    }
    
    /// Divides str into substrings based on a delimiter, returning an array of these substrings. (default is " ")
    ///
    /// - Parameter separator: A string to seperate the receiver
    /// - Returns: An array of string which separated by separator
    func split(_ separator: RegexConvertible = " ", limit: Int = 0) -> [String] {
        guard separator.pattern.length > 0 else { return self.characters.map { String($0) } }
        let result = trimmingCharacters(in: CharacterSet.whitespaces)
        guard separator.pattern != " " else { return result.components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty } }
        let datas = separator.regex.scan(self)
        var results: [String] = []
        var traceIndex: Int = 0
        for data in datas {
            if let str = self.range(traceIndex, data.range.location - 1) {
                results.append(str)
                traceIndex = data.range.location + data.range.length
            }
        }
        if traceIndex < self.length {
            results.append(self.from(traceIndex)!)
        }

        while let first = results.first {
            if first.isEmpty {
                results.remove(at: 0)
            } else {
                break
            }
        }
        
        while let last = results.last {
            if last.isEmpty {
                results = Array(results.dropLast())
            } else {
                break
            }
        }
        return results
    }
    
    func ljust(_ length: Int, _ padding: String = " ") -> String {
        guard self.length < length else { return self }
        let padding = padding.length == 0 ? " " : padding
        var result = self
        while result.length < length {
            result += padding
        }
        return result.substring(to: length)
    }
    
    func rjust(_ length: Int, _ padding: String = " ") -> String {
        guard self.length < length else { return self }
        let padding = padding.length == 0 ? " " : padding
        var result = ""
        let paddingLength = length - self.length
        while result.length < paddingLength {
            result += padding
        }
        return result.substring(to: paddingLength) + self
    }
    
    var strip: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var lstrip: String {
        var result = self
        while let first = result.characters.first {
            guard first =~ "[ \t\n\r]" else { break }
            result.remove(at: result.startIndex)
        }
        return result
    }
    
    var rstrip: String {
        return chomp
    }
    
    func concat(_ other: String) -> String {
        return self + other
    }
    
    @discardableResult mutating func prepend(_ other: String) -> String {
        self = other + self
        return self
    }
    
    @discardableResult mutating func replace(_ other: String) -> String {
        self = other
        return self
    }
    
    func partition(_ sep: String) -> [String] {
        let comps = self.components(separatedBy: sep)
        guard comps.length >= 2 else { return [self, "", ""] }
        return [comps[0], sep, comps.dropFirst().joined(separator: sep)]
    }
    
    func rpartition(_ sep: String) -> [String] {
        let comps = self.components(separatedBy: sep)
        guard comps.length >= 2 else { return ["", "", self] }
        return [comps.dropLast().joined(separator: sep), sep, comps.last!]
    }
}
