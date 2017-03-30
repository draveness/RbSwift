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
    ///
    /// 	(-1).abs    #=> 1
    /// 	(-2).abs    #=> 2
    /// 	(2).abs		#=> 2
    /// 	(0).abs		#=> 0
    ///
    var abs: Self {
        guard self < 0 else { return self }
        return -self
    }
    
    /// An alias to `Integer#abs`, returns the absolute value of `self`.
    ///
    /// 	(-1).magnitude		#=> 1
    /// 	(-2).magnitude		#=> 2
    /// 	(2).magnitude		#=> 2
    /// 	(0).magnitude		#=> 0
    ///
    /// - See Also: `Integer#abs`
    var magnitude: Self {
        return abs
    }
}
