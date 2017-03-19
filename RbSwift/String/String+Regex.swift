//
//  Regex.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
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
}
