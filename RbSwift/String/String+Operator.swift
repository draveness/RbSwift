//
//  Operator.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// Returns true if right pattern is match with left string, the pattern string would converts to a NSRegularExpression
/// automaticlly in method.
///
/// - Parameters:
///   - str: A string waiting to match
///   - pattern: A pattern used to match the string
/// - Returns: A bool value indicates whether the str is matched with the pattern
public func =~(str: String, pattern: String) -> Bool {
    return str =~ pattern.to_regex
}

/// Returns true if right pattern is match with left character, the pattern string would converts to a NSRegularExpression
/// automaticlly in method. This method use =~(str:pattern) internal to match char with pattern.
///
/// - Parameters:
///   - left: A `Character` waiting to match
///   - right: A pattern used to match the string
/// - Returns: A bool value indicates whether the char is matched with the pattern
public func =~(left: Character, right: String) -> Bool {
    return String(left) =~ right.to_regex
}

/// Returns true if right `Character` which converted to a `NSRegularExpression` is match with left character,
/// the pattern string would converts to a NSRegularExpression automaticlly in method.
/// This method use =~(str:pattern) internal to match char with pattern.
///
/// - Parameters:
///   - str: A string waiting to match
///   - right: A Character used to match the string, will convert to String, and eventually NSRegularExpression.
/// - Returns: A bool value indicates whether the char is matched with the pattern
public func =~(left: String, right: Character) -> Bool {
    return left =~ String(right).to_regex
}

/// Returns a new String containing integer copies of the receiver. integer must be greater than or equal to 0.
/// If integer is less than of equal to 0, this methods will return an empty string.
///
/// - Parameters:
///   - left: A string
///   - right: A integer indicates how many times the string will duplicate
/// - Returns: A new String containing integer copies of the receiver
public func *(left: String, right: Int) -> String {
    guard right > 0 else { return "" }
    var result = ""
    for _ in 1...right {
        result.append(left)
    }
    return result
}

/// Returns a new String containing integer copies of the receiver. integer must be greater than or equal to 0.
/// If integer is less than of equal to 0, this methods will return an empty string.
///
/// - Parameters:
///   - left: A integer indicates how many times the string will duplicate
///   - right: A string
/// - Returns: A new String containing integer copies of the receiver
public func *(left: Int, right: String) -> String {
    return right * left
}

/// Returns a new String containing the two strings passed into this operator.
///
/// - Parameters:
///   - left: A string
///   - right: Anther string
/// - Returns: A new string containing the two strings passed into this operator
public func <<(left: String, right: String) -> String {
    return left + right
}
