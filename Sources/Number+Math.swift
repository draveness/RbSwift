//
//  Number+Math.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Math
public extension Int {
    /// Returns the greatest common divisor (always positive).
    /// 0.gcd(x) and x.gcd(0) return abs(x).
    ///
    /// 	2.gcd(2)		#=> 2
    /// 	1.gcd(-7)		#=> 1
    /// 	0.gcd(2)		#=> 2
    /// 	0.gcd(-2)		#=> 2
    /// 	(-2).gcd(0)		#=> 2
    /// 	((1<<31)-1).gcd((1<<61)-1)  #=> 1
    ///
    /// - Parameter another: Another integer
    /// - Returns: The greatest common divisor
    func gcd(_ another: Int) -> Int {
        var one = self
        var another = another
        while another != 0 {
            (one, another) = (another, one % another)
        }
        return one.abs
    }
    
    /// Returns the least common multiple (always positive).
    ///
    /// 	2.lcm(2)		#=> 2
    /// 	3.lcm(-7)		#=> 21
    ///
    /// 0.lcm(x) and x.lcm(0) return zero.
    ///
    ///     0.lcm(10)       #=> 0
    ///     10.lcm(0)       #=> 0
    ///
    /// - Parameter another: Another integer
    /// - Returns: The least common mutiple
    func lcm(_ another: Int) -> Int {
        return ((self / gcd(another)) * another).abs
    }
    
    /// Returns an tuple (`Number#gcd(another:)`, `Number#lcm(another:)`).
    ///
    /// 	2.gcdlcm(2)         #=> (2, 2)
    /// 	3.gcdlcm(-7)        #=> (1, 21)
    ///
    /// - Parameter another: Another integer
    /// - Returns: A tuple contains the gcd and lcm
    func gcdlcm(_ another: Int) -> (Int, Int) {
        return (gcd(another), lcm(another))
    }
    
    /// Returns the number of bits of the value of Integer.
    /// "the number of bits" means that the bit position of the highest bit
    /// which is different to the sign bit. (The bit position of the bit 2**n is n+1.)
    /// If there is no such bit (zero or minus one), zero is returned.
    ///
    /// 	(-(2 ** 12) - 1).bitLength		#=> 13
    /// 	(-(2 ** 12)).bitLength          #=> 12
    /// 	(-(2 ** 12) + 1).bitLength		#=> 12
    /// 	(-0x101).bitLength              #=> 9
    /// 	(-0x100).bitLength              #=> 8
    /// 	(-0xff).bitLength               #=> 8
    /// 	(-2).bitLength                  #=> 1
    /// 	(-1).bitLength                  #=> 0
    /// 	0.bitLength                     #=> 0
    /// 	1.bitLength                     #=> 1
    /// 	0xff.bitLength                  #=> 8
    /// 	0x100.bitLength                 #=> 9
    /// 	(2 ** 12 - 1).bitLength         #=> 12
    /// 	(2 ** 12).bitLength             #=> 13
    /// 	(2 ** 12 + 1).bitLength         #=> 13
    ///
    var bitLength: Int {
        let value = self < 0 ? -self : self + 1
        return ceil_(log2(value.to_double)).to_i
    }
    
    /// Returns the Integer equal to self + 1.
    ///
    /// 	1.next		#=> 2
    /// 	(-1).next		#=> 0
    ///
    var next: Int {
        return self + 1
    }
    
    /// Returns the Integer equal to self + 1.
    ///
    /// 	1.succ		#=> 2
    /// 	(-1).succ		#=> 0
    ///
    var succ: Int {
        return next
    }
    
    /// Returns the Integer equal to self - 1.
    ///
    /// 	1.pred		#=> 0
    /// 	(-1).pred		#=> -2
    ///
    var pred: Int {
        return self - 1
    }
    
    /// Returns the largest number less than or equal to int in decimal digits.
    ///
    /// 	1.ceil          #=> 1
    /// 	1.5.ceil		#=> 2
    ///
    var ceil: Int {
        return ceil_(self.to_double)
    }
    
    /// Returns the smallest number less than or equal to int in decimal digits.
    ///
    /// 	1.floor         #=> 1
    /// 	1.5.floor		#=> 1
    ///
    var floor: Int {
        return floor_(self.to_double)
    }
    
    /// Rounds int to a given precision in decimal digits.
    ///
    /// 	1.round         #=> 1
    /// 	1.5.round		#=> 2
    /// 	1.4.round		#=> 1
    ///
    var round: Int {
        return round_(self.to_double)
    }
    
    /// Returns the array including the digits extracted by place-value notation with radix base of int.
    ///
    /// 	12345.digits            #=> [5, 4, 3, 2, 1]
    /// 	12345.digits(7)         #=> [4, 6, 6, 0, 5]
    /// 	12345.digits(100)		#=> [45, 23, 1]
    /// 	(-12345).digits(7)		#=> []
    ///
    var digits: [Int] {
        return digits()
    }
    
    /// Returns the array including the digits extracted by place-value notation with radix base of int.
    ///
    /// 	12345.digits            #=> [5, 4, 3, 2, 1]
    /// 	12345.digits(7)         #=> [4, 6, 6, 0, 5]
    /// 	12345.digits(100)		#=> [45, 23, 1]
    /// 	(-12345).digits(7)		#=> []
    ///
    /// - Parameter base: A radix indicates the base of integer
    /// - Returns: An array of digits
    func digits(_ base: Int = 10) -> [Int] {
        guard self > 0 && base >= 2 else { return [] }
        var result: [Int] = []
        var value = self
        while value / base != 0 {
            result.append(value % base)
            value = value / base
        }
        result.append(value % base)
        return result
    }
}

// MARK: - Math
public extension Double {
    /// Returns the largest number less than or equal to int in decimal digits.
    ///
    /// 	1.ceil          #=> 1
    /// 	1.5.ceil		#=> 2
    ///
    var ceil: Int {
        return ceil_(self)
    }
    
    /// Returns the smallest number less than or equal to int in decimal digits.
    ///
    /// 	1.floor         #=> 1
    /// 	1.5.floor		#=> 1
    ///
    var floor: Int {
        return floor_(self)
    }
    
    /// Rounds int to a given precision in decimal digits.
    ///
    /// 	1.round         #=> 1
    /// 	1.5.round		#=> 2
    /// 	1.4.round		#=> 1
    ///
    var round: Int {
        return round_(self)
    }
}

fileprivate func ceil_(_ value: Double) -> Int {
    return ceil(value).to_i
}

fileprivate func floor_(_ value: Double) -> Int {
    return floor(value).to_i
}

fileprivate func round_(_ value: Double) -> Int {
    return round(value).to_i
}
