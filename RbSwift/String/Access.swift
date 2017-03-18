//
//  String+Access.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    func at(_ pos: Int) -> String? {
        if pos >= length { return nil }
        return self.split("")[pos]
    }
    
    func at(_ range: CountableClosedRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound > length - 1 ? length - 1 : range.upperBound
        return self.split("")[range.lowerBound...upperBound].joined()
    }
    
    func at(_ range: CountableRange<Int>) -> String? {
        if range.lowerBound > length { return nil }
        if range.lowerBound == length { return "" }
        let upperBound = range.upperBound >= length ? length : range.upperBound
        return self.split("")[range.lowerBound..<upperBound].joined()
    }
    
    var first: String {
        return first(1)
    }
    
    func first(_ num: Int) -> String {
        if num <= 0 { return "" }
        if num >= self.length { return self }
        return split("")[0..<num].joined()
    }
    
    var last: String {
        return last(1)
    }
    
    func last(_ num: Int) -> String {
        if num <= 0 { return "" }
        if num >= self.length { return self }
        return split("")[self.length-num..<self.length].joined()
    }
    
    func from(_ num: Int) -> String? {
        guard num < self.length && num > -self.length else { return "" }
        let num = (0..<self.length).contains(num) ? num : self.length + num
        return substring(from: num)
    }
    
    func to(_ num: Int) -> String? {
        if num >= self.length { return self }
        if num <= -self.length { return "" }
        let num = (0..<self.length).contains(num) ? num + 1 : self.length + num + 1
        return substring(to: num)
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
    
    var chr: String {
        guard let firstChar = self.characters.first else { return "" }
        return "\(firstChar)"
    }
    
    func index(_ str: String) -> Int? {
        guard let data = matchAll(str).first else { return nil }
        return data.range.location
    }
    
    func rindex(_ str: String) -> Int? {
        guard let data = matchAll(str).last else { return nil }
        return data.range.location
    }
}
