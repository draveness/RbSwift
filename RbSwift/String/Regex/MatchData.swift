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
    public let datas: [String]
    public let ranges: [NSRange]
    
    public var to_a: [String] {
        return [match] + datas
    }
}
