//
//  Conversions.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

fileprivate let radix = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

public extension String {
    var to_i: Int {
        return to_i(10)
    }
    
    func to_i(_ base: Int = 10) -> Int {
        guard Array(2...36).contains(base) else { return 0 }
        let nums = radix[0..<base]
        var result = ""
        for char in split("") {
            guard nums.contains(char) else { break }
            result.append(char)
        }
        
        var value = 0
        for (index, bit) in result.reverse.split("").enumerated() {
            value += Int(pow(Double(base), Double(index))) * nums.index(of: bit)!
        }
        return value
    }
}
