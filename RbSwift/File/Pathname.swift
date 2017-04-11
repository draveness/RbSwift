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
    
    /// Returns the current working directory as a Pathname.
    public static var getwd: Pathname {
        return Pathname(Dir.getwd)
    }
    
    /// Predicate method for testing whether a path is absolute.
    public var isAbsolute: Bool {
        return path.hasPrefix("/")
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

public func +(lhs: Pathname, rhs: Pathname) -> Pathname {
    return lhs.path.appendPath(rhs.path)
}

public func +(lhs: String, rhs: Pathname) -> Pathname {
    return lhs.appendPath(rhs.path)
}

public func +(lhs: Pathname, rhs: String) -> Pathname {
    return lhs.path.appendPath(rhs)
}

/// Appends a String fragment to another String to produce a new Path
/// Origianally from https://github.com/kylef/PathKit/blob/master/Sources/PathKit.swift#L750
private extension String {
    func appendPath(_ path: String) -> Pathname {
        if path.hasPrefix("/") {
            // Absolute paths replace relative paths
            return Pathname(path)
        } else {
            var lSlice = NSString(string: self).pathComponents
            var rSlice = NSString(string: path).pathComponents
            
            // Get rid of trailing "/" at the left side
            if lSlice.count > 1 && lSlice.last == "/" { lSlice.removeLast() }
            
            // Advance after the first relevant "."
            lSlice = lSlice.filter { $0 != "." }
            rSlice = rSlice.filter { $0 != "." }
            
            // Eats up trailing components of the left and leading ".." of the right side
            while lSlice.last != ".." && rSlice.first == ".." {
                if (lSlice.count > 1 || lSlice.first != "/") && !lSlice.isEmpty {
                    // A leading "/" is never popped
                    lSlice.removeLast()
                }
                if !rSlice.isEmpty {
                    rSlice.removeFirst()
                }
                
                switch (lSlice.isEmpty, rSlice.isEmpty) {
                case (true, _):
                    break
                case (_, true):
                    break
                default:
                    continue
                }
            }
            
            let components = lSlice + rSlice
            if components.isEmpty {
                return Pathname(".")
            } else if components.first == "/" && components.count > 1 {
                let p = components.joined(separator: "/")
                let path = p.substring(from: p.characters.index(after: p.startIndex))
                return Pathname(path)
            } else {
                let path = components.joined(separator: "/")
                return Pathname(path)
            }
        }
    }
}
