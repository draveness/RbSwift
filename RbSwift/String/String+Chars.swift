//
//  String+Chars.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Chars
public extension String {
    /// Returns all characters in string form intead of characters form
    ///
    /// 	"abcde".chars       #=> ["a", "b", "c", "d", "e"]
    ///
    var chars: [String] {
        return split("")
    }
    
    /// Returns all lines in string form separated by newline `\n`.
    ///
    /// 	"a\nb\nc\nd\ne".lines       #=> ["a", "b", "c", "d", "e"]
    ///
    var lines: [String] {
        return lines()
    }
    
    /// Returns all lines in string form separated by separator.
    ///
    /// 	"abcde".chars                   #=> ["a", "b", "c", "d", "e"]
    /// 	"a\tb\tc\td\te".lines("\t")		#=> ["a", "b", "c", "d", "e"]
    ///
    /// - Parameter separator: A separator used to separate the receiver string
    /// - Returns: An array of strings separated by separator
    func lines(_ separator: String = "\n") -> [String] {
        return components(separatedBy: separator)
    }
}
