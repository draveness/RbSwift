//
//  Number+Exponentiative.swift
//  RbSwift
//
//  Created by Draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ** : ExponentiationPrecedence

/// Raises integer to the power of numeric, which may be negative or fractional.
/// The result may be **overflow**.
///
/// 	1 ** 2		#=> 1
/// 	2 ** 2		#=> 4
/// 	-2 ** 2		#=> 4
/// 	-(2 ** 2)   #=> -4
/// 	-2 ** 0		#=> 1
///
/// - Parameters:
///   - integer: An integer indicates the numeric
///   - numeric: An integer indicates the power
/// - Returns: An integer which is the power of numeric
public func **(integer: Int, numeric: Int) -> Int {
    return (integer.to_double ** numeric.to_double).to_i
}

/// Raises integer to the power of numeric, which may be negative or fractional.
///
/// 	1 ** 2		#=> 1
/// 	2 ** 2		#=> 4
/// 	-2 ** 2		#=> 4
/// 	-(2 ** 2)   #=> -4
/// 	-2 ** 0		#=> 1
///
/// - Parameters:
///   - double: An double indicates the numeric
///   - numeric: An double indicates the power
/// - Returns: An integer which is the power of numeric
public func **(double: Double, numeric: Double) -> Double {
    return pow(double, numeric)
}
