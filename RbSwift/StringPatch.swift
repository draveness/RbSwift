//
//  String+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 15/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public struct MatchData {
    public let match: String
    public let range: NSRange
    public let datas: [String]
    public let ranges: [NSRange]
    
    public var to_a: [String] {
        return [match] + datas
    }
}

public extension String {
    var length: Int {
        return self.characters.count
    }
    
    var size: Int {
        return self.length
    }
    
    var count: Int {
        return self.length
    }
    
    func concat(_ other: String) -> String {
        return self + other
    }
    
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
    
    func chomp(_ chars: String = "") -> String {
        guard self.length > 0 else { return "" }
        guard chars.length > 0 else {
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
        guard hasSuffix(chars) else { return self }
        let substring = self.substring(to: self.length - chars.length)
        return substring
    }
    
    func substring(from: Int) -> String {
        let string = self as NSString
        let substring = string.substring(from: from)
        return substring
    }
    
    func substring(to: Int) -> String {
        let string = self as NSString
        let substring = string.substring(to: to)
        return substring
    }
    
    var chop: String {
        guard self.length > 0 else { return "" }
        var result = self
        result.remove(at: result.index(before: result.endIndex))
        return result
    }
    
    var chr: String {
        guard let firstChar = self.characters.first else { return "" }
        return "\(firstChar)"
    }
    
    mutating func clear() -> String {
        self = ""
        return self
    }
    
    var downcase: String {
        return self.lowercased()
    }
    
    mutating func downcased() {
        self = downcase
    }
    
    var upcase: String {
        return self.uppercased()
    }
    
    mutating func upcased() {
        self = upcase
    }
    
    var swapcase: String {
        return self.split("").map { $0.isUpcase ? $0.downcase : $0.upcase }.joined()
    }
    
    func eachLine(_ separator: String = "\n", closure: (String) -> Void) {
        var lines = components(separatedBy: separator)
        for (index, line) in lines.enumerated() {
            if index != lines.count - 1 {
                lines[index] = line + separator
            }
        }
        lines.filter { $0.length > 0 }.forEach(closure)
    }
    
    func eachChar(closure: (String) -> Void) {
        for char in self.characters {
            closure("\(char)")
        }
    }
    
    var reverse: String {
        return String(self.characters.reversed())
    }
    
    var split: [String] {
        return split(" ")
    }
    
    func split(_ separator: String = " ") -> [String] {
        guard separator.length > 0 else { return self.characters.map { String($0) } }
        let result = trimmingCharacters(in: CharacterSet.whitespaces)
        guard separator != " " else { return result.components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty } }
        var results = result.components(separatedBy: separator)
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
    
    func match(_ pattern: String) -> MatchData? {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        guard let result = regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.length)) else { return nil }
        let str = self as NSString
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
    
    func matchAll(_ pattern: String) -> [MatchData] {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.length))

        let str = self as NSString
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
    
    mutating func prepend(_ other: String) -> String {
        self = other + self
        return self
    }
    
    mutating func replace(_ other: String) -> String {
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
    
    func index(_ str: String) -> Int? {
        guard let data = matchAll(str).first else { return nil }
        return data.range.location
    }
    
    func rindex(_ str: String) -> Int? {
        guard let data = matchAll(str).last else { return nil }
        return data.range.location
    }
    
    func sub(_ pattern: String, _ str: String) -> String {
        guard let matchData = match(pattern) else { return self }
        return (self as NSString).replacingCharacters(in: matchData.range, with: str)
    }
    
    mutating func subed(_ pattern: String, _ str: String) {
        self = sub(pattern, str)
    }
    
    func gsub(_ pattern: String, _ str: String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.length), withTemplate: str)
    }
    
    mutating func gsubed(_ pattern: String, _ str: String) {
        self = gsub(pattern, str)
    }
    
    func gsub(_ pattern: String, closure: (String) -> String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matchDatas = matchAll(pattern)
        var result: String = self
        for matchData in matchDatas.reversed() {
            result = regex.stringByReplacingMatches(in: result, options: [], range: NSMakeRange(0, self.length), withTemplate: closure(matchData.match))
        }
        return result as String
    }
    
    mutating func gsubed(_ pattern: String, closure: (String) -> String) {
        self = gsub(pattern, closure: closure)
    }

    var freeze: String {
        return self
    }    
}

infix operator =~

public func =~(left: String, right: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: right, options: NSRegularExpression.Options(rawValue: 0))
    guard let _ = regex.firstMatch(in: left, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, left.length)) else { return false }
    return true
}

public func =~(left: Character, right: String) -> Bool {
    return String(left) =~ right
}

public func *(left: String, right: Int) -> String {
    guard right > 0 else { return "" }
    var result = ""
    for _ in 1...right {
        result.append(left)
    }
    return result
}

public func *(left: Int, right: String) -> String {
    return right * left
}

public func <<(left: String, right: String) -> String {
    return left + right
}
