//
//  RegexSupport.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

/// A Regexp holds a regular expression, used to match a pattern against strings.
/// Regexps are created using the `"xyz".regex` and by `init(pattern:)` constructor.
public struct Regexp {
    let pattern: String
    init(_ pattern: String) {
        self.pattern = pattern
    }
    
}
