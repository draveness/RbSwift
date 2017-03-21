//
//  Number+MathSpec.swift
//  RbSwift
//
//  Created by Draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberMathSpec: QuickSpec {
    
    override func spec() {
        describe(".gcd(other:)") {
            it("returns the greatest common divisor (always positive).") {
                expect(2.gcd(2)).to(equal(2))
                expect(1.gcd(-7)).to(equal(1))
                expect(((1<<31)-1).gcd((1<<61)-1)).to(equal(1))
                expect(0.gcd(2)).to(equal(2))
                expect(0.gcd(-2)).to(equal(2))
                expect((-2).gcd(0)).to(equal(2))
            }
        }
        
        describe(".lcm(other:)") {
            it("returns the least common multiple (always positive).") {
                expect(2.lcm(2)).to(equal(2))
                expect(3.lcm(-7)).to(equal(21))
            }
        }
        
        describe(".gcdlcm(other:)") { 
            it("return the gcd and lcm in a tuple") {
                expect(2.gcdlcm(2).0).to(equal(2))
                expect(2.gcdlcm(2).1).to(equal(2))
                expect(3.gcdlcm(-7).0).to(equal(1))
                expect(3.gcdlcm(-7).1).to(equal(21))
            }
        }
        
        describe(".bitLength") { 
            it("returns the number of bits of the value") {
//                expect((-2**10000-1).bitLength).to(equal(10001))
//                expect((-2**10000).bitLength).to(equal(10000))
//                expect((-2**10000+1).bitLength).to(equal(10000))
//                expect((-2**1000-1).bitLength).to(equal(1001))
//                expect((-2**1000).bitLength).to(equal(1000))
//                expect((-2**1000+1).bitLength).to(equal(1000))
                expect((-(2 ** 12) - 1).bitLength).to(equal(13))
                expect((-(2 ** 12)).bitLength).to(equal(12))
                expect((-(2 ** 12) + 1).bitLength).to(equal(12))
                expect((-0x101).bitLength).to(equal(9))
                expect((-0x100).bitLength).to(equal(8))
                expect((-0xff).bitLength).to(equal(8))
                expect((-2).bitLength).to(equal(1))
                expect((-1).bitLength).to(equal(0))
                expect(0.bitLength).to(equal(0))
                expect(1.bitLength).to(equal(1))
                expect(0xff.bitLength).to(equal(8))
                expect(0x100.bitLength).to(equal(9))
                expect((2 ** 12 - 1).bitLength).to(equal(12))
                expect((2 ** 12).bitLength).to(equal(13))
                expect((2 ** 12 + 1).bitLength).to(equal(13))
//                expect((2**1000-1).bitLength).to(equal(1000))
//                expect((2**1000).bitLength).to(equal(1001))
//                expect((2**1000+1).bitLength).to(equal(1001))
//                expect((2**10000-1).bitLength).to(equal(10000))
//                expect((2**10000).bitLength).to(equal(10001))
//                expect((2**10000+1).bitLength).to(equal(10001))
            }
        }
        
        describe(".next") {
            it("returns an integer plus one") {
                expect(1.next).to(equal(2))
                expect((-1).next).to(equal(0))
            }
        }
        
        describe(".succ") { 
            it("returns an integer plus one") {
                expect(1.succ).to(equal(2))
                expect((-1).succ).to(equal(0))
            }
        }
        
        describe(".pred") { 
            it("returns an integer minus one") {
                expect(1.pred).to(equal(0))
                expect((-1).pred).to(equal(-2))
            }
        }
        
        describe(".ceil") {
            it("returns the smallest number than or equal to int in decimal digits (default 0 digits).") {
                expect(1.ceil).to(equal(1))
                expect(1.5.ceil).to(equal(2))
            }
        }
        
        describe(".floor") {
            it("returns the biggest number than or equal to int in decimal digits (default 0 digits).") {
                expect(1.floor).to(equal(1))
                expect(1.5.floor).to(equal(1))
            }
        }
    }
}
