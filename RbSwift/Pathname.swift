//
//  Path.swift
//  RbSwift
//
//  Created by Draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public struct Pathname {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }
    
    public static func +(lhs: Pathname, rhs: Pathname) -> Pathname {
        let newPath = (lhs.path as NSString).appendingPathComponent(rhs.path)
        return Pathname(newPath)
    }
}

extension Pathname: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: Pathname, rhs: Pathname) -> Bool {
        return lhs.path == rhs.path
    }
}

