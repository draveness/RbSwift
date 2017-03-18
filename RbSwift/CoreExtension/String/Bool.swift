//
//  Exclude.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    func isExlude(_ substring: String) -> Bool {
        return !isInclude(substring)
    }
    
    func isStartWith(_ substring: String) -> Bool {
        return hasPrefix(substring)
    }
    
    func isStartWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isStartWith).isAny(obj: true)
    }
    
    func isEndWith(_ substring: String) -> Bool {
        return hasSuffix(substring)
    }
    
    func isEndWith(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isEndWith).isAny(obj: true)
    }
    
    func isInclude(_ substring: String) -> Bool {
        return contains(substring)
    }
    
    func isInclude(_ substrings: [String]) -> Bool {
        return substrings.flatMap(isInclude).isAny(obj: true)
    }

    var isBlank: Bool {
        return self.split("").reduce(true) { $0 && ($1 =~ "[\r\n\t ]") }
    }
    
    var isDowncase: Bool {
        return self.downcase == self
    }
    
    var isUpcase: Bool {
        return self.upcase == self
    }
}
