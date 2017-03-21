//
//  Number+AbsoluteValue.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Integer where Self: SignedNumber {
    /// Returns the absolute value of `self`.
    var abs: Self {
        guard self < 0 else { return self }
        return -self
    }
    
    /// An alias to `abs`, returns the absolute value of `self`.
    var magnitude: Self {
        return abs
    }
}
