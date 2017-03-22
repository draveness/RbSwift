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
    /// 0.lcm(x) and x.lcm(0) return zero.
    ///
    /// - Parameter another: Another integer
    /// - Returns: The least common mutiple
    func lcm(_ another: Int) -> Int {
        return ((self / gcd(another)) * another).abs
    }
    
    /// Returns an tuple (self.gcd(another:), self.lcm(another:).
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
    var bitLength: Int {
        let value = self < 0 ? -self : self + 1
        return ceil_(log2(value.to_double)).to_i
    }
    
    /// Returns the Integer equal to self + 1.
    var next: Int {
        return self + 1
    }
    
    /// Returns the Integer equal to self + 1.
    var succ: Int {
        return next
    }
    
    /// Returns the Integer equal to self - 1.
    var pred: Int {
        return self - 1
    }
    
    /// Returns the largest number less than or equal to int in decimal digits.
    var ceil: Int {
        return ceil_(self.to_double)
    }
    
    /// Returns the smallest number less than or equal to int in decimal digits.
    var floor: Int {
        return floor_(self.to_double)
    }
    
    /// Rounds int to a given precision in decimal digits.
    var round: Int {
        return round_(self.to_double)
    }
    
    /// Returns the array including the digits extracted by place-value notation with radix base of int.
    var digits: [Int] {
        return digits()
    }
    
    /// Returns the array including the digits extracted by place-value notation with radix base of int.
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
    var ceil: Int {
        return ceil_(self)
    }
    
    /// Returns the smallest number less than or equal to int in decimal digits.
    var floor: Int {
        return floor_(self)
    }
    
    /// Rounds int to a given precision in decimal digits.
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
