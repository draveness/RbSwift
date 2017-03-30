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
    var pattern: String { get }
}

extension Regex: RegexConvertible {
    /// An alias to self
    public var regex: Regex {
        return self
    }
}

extension String: RegexConvertible {
    /// Returns a literal `Regex`.
    public var regex: Regex {
        return to_regex
    }
    
    public var pattern: String {
        return self
    }
}

extension Character: RegexConvertible {
    /// Returns a literal `Regex` by first converting to string.
    public var regex: Regex {
        return String(self).regex
    }
    
    public var pattern: String {
        return String(self)
    }
}
