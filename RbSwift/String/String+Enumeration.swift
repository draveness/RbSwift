//
//  Enumeration.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Enumeration
public extension String {
    /// Splits str using the supplied parameter as the record separator `\n`, 
    /// passing each substring with separator in turn to the supplied closure.
    /// 
    ///     var results: [String] = []
    ///     "Hello\nWorld".eachLine {
    ///         results.append($0)
    ///     }
    ///     results         #=> ["Hello\n", "World"]
    ///
    /// If a zero-length record separator is supplied, the string is split into 
    /// paragraphs delimited by multiple successive newlines.
    ///
    ///     var results: [String] = []
    ///     "Hello\nWorld".eachLine("l") {
    ///         results.append($0)
    ///     }
    ///     results         #=> ["Hel", "l", "o\nWorl", "d"]
    ///
    /// - Parameters:
    ///   - separator: A string used to separate the receiver string
    ///   - closure: A closure reveives String as parameter which is separated by the separator
    func eachLine(_ separator: String = "\n", closure: (String) -> Void) {
        var lines = self.lines(separator)
        for (index, line) in lines.enumerated() {
            if index != lines.count - 1 {
                lines[index] = line + separator
            }
        }
        lines.filter { $0.length > 0 }.forEach(closure)
    }
    
    /// Passes each character as string in the receiver to the given closure.
    ///
    ///     var results: [String] = []
    ///     "Hello\n".eachChar {
    ///         results.append($0)
    ///     }
    ///     results         #=> ["H", "e", "l", "l", "o", "\n"]
    ///
    /// - Parameter closure: A closure receives all characters as String
    func eachChar(closure: (String) -> Void) {
        for char in self.chars {
            closure(char)
        }
    }
}
