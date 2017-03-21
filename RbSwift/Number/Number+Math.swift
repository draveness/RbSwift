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
        return ceil(log2(value.to_double)).to_i
//        return log2(self.to_double).to_i
//        return 0
    }
}
