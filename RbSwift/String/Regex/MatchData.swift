//
//  MatchData.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public struct MatchData {
    public let match: String
    public let range: NSRange
    public let captures: [String]
    public let ranges: [NSRange]
    
    /// Returns the number of elements in the match array.
    public var size: Int {
        return to_a.size
    }
    
    /// Returns the array of matches.
    public var to_a: [String] {
        return [match] + captures
    }
    
    /// Returns the entire matched string.
    public var to_s: String {
        return match
    }
}
