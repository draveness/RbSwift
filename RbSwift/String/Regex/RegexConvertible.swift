//
//  RegexConvertible.swift
//  RbSwift
//
//  Created by Draveness on 20/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public protocol RegexConvertible {
    /// Returns `Regex` as a wrapper for `NSRegularExpression`
    var regex: Regex { get }
}

extension Regex: RegexConvertible {
    /// An alias to self
    public var regex: Regex {
        return self
    }
}

extension String: RegexConvertible {
    /// An alias to `to_regex` which returns a `Regexp` struct.
    public var regex: Regex {
        return to_regex
    }
}

extension Character: RegexConvertible {
    /// Returns a `Regex` by first converting to string.
    public var regex: Regex {
        return String(self).to_regex
    }
}
