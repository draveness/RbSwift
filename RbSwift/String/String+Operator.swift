//
//  Operator.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

infix operator =~

public func =~(left: String, right: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: right, options: NSRegularExpression.Options(rawValue: 0))
    guard let _ = regex.firstMatch(in: left, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, left.length)) else { return false }
    return true
}

public func =~(left: Character, right: String) -> Bool {
    return String(left) =~ right
}

public func =~(left: String, right: Character) -> Bool {
    return left =~ String(right)
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
