//
//  Transform.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    /// Returns a new String with the \n, \r, \v, " " and \r\n removed from the end of str,
    var chomp: String {
        guard self.length > 0 else { return "" }
        var result = self
        while let last = result.characters.last {
            guard last =~ "[ \t\n\r\\v]" else { break }
            result = result.chop
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
    
    func count(_ strs: String...) -> Int {
        let strs = strs.map { "[\($0)]" }
        let sets = strs.map { Set<MatchData>($0.regex.scan(self)) }
        guard let first = sets.first else { return 0 }
        return sets.reduce(first, { (result, set) in
            result.intersection(set)
        }).count
    }
    
    func delete(_ strs: String...) -> String {
        <#function body#>
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
    /// If pattern is a `String`, then its contents are used as the delimiter when splitting str. If pattern is a single space, str is split on whitespace, with leading whitespace and runs of contiguous whitespace characters ignored.
    /// If pattern is a `Regex`, str is divided where the pattern matches. Whenever the pattern matches a zero-length string, str is split into individual characters. If pattern contains groups, the respective matches will be returned in the array as well.
    /// - Parameter separator: A string to seperate the receiver
    /// - Returns: An array of string which separated by separator
    func split(_ separator: RegexConvertible = " ", limit: Int = 0) -> [String] {
        guard separator.pattern.length > 0 else { return self.characters.map { String($0) } }
        let result = trimmingCharacters(in: CharacterSet.whitespaces)
        guard separator.pattern != " " else { return result.components(separatedBy: CharacterSet.whitespacesAndNewlines).filter { !$0.isEmpty } }
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
    
    /// If integer is greater than the length of str, returns a new String of length integer 
    /// with str left justified and padded with padstr; otherwise, returns str.
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to ljust
    func ljust(_ length: Int, _ padding: String = " ") -> String {
        guard self.length < length else { return self }
        let padding = padding.length == 0 ? " " : padding
        var result = self
        while result.length < length {
            result += padding
        }
        return result.substring(to: length)
    }
    
    /// If integer is greater than the length of str, returns a new String of length integer
    /// with str right justified and padded with padstr; otherwise, returns str.
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to rjsut
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
    
    /// Centers str in width. If width is greater than the length of str, 
    /// returns a new String of length width with str centered and padded 
    /// with padstr; otherwise, returns str.
    ///
    /// - Parameters:
    ///   - length: A int to indicates the return length of the new string
    ///   - padding: A string used to padding str
    /// - Returns: A new string use padding string to center
    func center(_ width: Int, _ padding: String = " ") -> String {
        guard self.length < width else { return self }
        let leftLength: Int = (width - self.length) / 2
        let rightLength = width - self.length - leftLength
        
        let left = (padding * (leftLength / padding.length + 1)).to(leftLength - 1)!
        let right = (padding * (rightLength / padding.length + 1)).to(rightLength - 1)!
        return left + self + right
    }
    
    /// Returns a copy of str with leading and trailing whitespace removed.
    var strip: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Removes leading and trailing whitespace from str.
    ///
    /// - Returns: Self
    @discardableResult mutating func stripped() -> String {
        self = strip
        return self
    }
    
    /// Returns a copy of str with leading whitespace removed. See also `rstrip` and `strip`.
    var lstrip: String {
        var result = self
        while let first = result.characters.first {
            guard first =~ "[ \t\n\r\\v]" else { break }
            result.remove(at: result.startIndex)
        }
        return result
    }
    
    /// Removes leading whitespace from str.
    ///
    /// - Returns: Self
    @discardableResult mutating func lstripped() -> String {
        self = lstrip
        return self
    }
    
    /// Returns a copy of str with trailing whitespace removed. See also `strip` and `lstrip`.
    var rstrip: String {
        return chomp
    }
    
    /// Removes trailing whitespace from str.
    ///
    /// - Returns: Self
    @discardableResult mutating func rstripped() -> String {
        self = rstrip
        return self
    }
    
    /// Concatenates the given str to the receiver
    ///
    /// - Parameter other: A string use to concat to the receiver
    /// - Returns: A new string with self + other
    func concat(_ other: String) -> String {
        return self + other
    }
    
    /// Similar to `append` method, prepend another string to the receiver.
    ///
    /// - Parameter other: Anothing string
    /// - Returns: Self
    @discardableResult mutating func prepend(_ other: String) -> String {
        self = other + self
        return self
    }
    
    /// Replace the receiver string by the passing parameter
    ///
    /// - Parameter other: A new string used to replace self
    /// - Returns: Self
    @discardableResult mutating func replace(_ other: String) -> String {
        self = other
        return self
    }
    
    /// Searches sep or pattern (Regex) in the string and returns the part 
    /// before it, the match, and the part after it. If it is not found,
    /// returns two empty strings and str.
    ///
    /// - Parameter pattern: A string used to separate the receiver
    /// - Returns: An array of string which separated by seperator
    func partition(_ pattern: RegexConvertible) -> [String] {
        guard let data = match(pattern),
            let head = self.to(data.range.location - 1),
            let tail = self.from(data.range.location + data.range.length) else { return [self, "", ""] }
        return [head, data.match, tail]
    }
    
    /// Searches sep or pattern (regexp) in the string from the end of the 
    /// string, and returns the part before it, the match, and the part after it. 
    /// If it is not found, returns two empty strings and str.
    ///
    /// - Parameter pattern: A string used to separate the receiver
    /// - Returns: An array of string which separated by seperator
    func rpartition(_ pattern: RegexConvertible) -> [String] {
        guard let data = scan(pattern).last,
            let head = self.to(data.range.location - 1),
            let tail = self.from(data.range.location + data.range.length) else { return ["", "", self] }
        return [head, data.match, tail]
    }
}
