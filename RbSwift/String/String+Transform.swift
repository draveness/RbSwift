//
//  Transform.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
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
    
    var chop: String {
        guard self.length > 0 else { return "" }
        var result = self
        result.remove(at: result.index(before: result.endIndex))
        return result
    }
    
    mutating func clear() -> String {
        self = ""
        return self
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
}
