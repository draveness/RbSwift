//
//  Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringConversionsSpec: QuickSpec {
    override func spec() {
        describe(".to_i") {
            it("returns an integer under different circumstances") {
                expect("0a".to_i(16)).to(equal(10))
                expect("0xa".to_i(16)).to(equal(0))
                expect("12".to_i).to(equal(12))
                expect("-1100101".to_i(2)).to(equal(-101))
                expect("1100101".to_i(2)).to(equal(101))
                expect("1100101".to_i(8)).to(equal(294977))
                expect("1100101".to_i(10)).to(equal(1100101))
                expect("1100101".to_i(16)).to(equal(17826049))
            }
            
            it("returns zero if base is not in 2...36") {
                expect("".to_i).to(equal(0))
                expect("  ".to_i).to(equal(0))
                expect("0a".to_i(1)).to(equal(0))
                expect("0a".to_i(37)).to(equal(0))
            }
            
            it("returns zero if format is invalid") {
                expect("-".to_i).to(equal(0))
                expect("d-1".to_i).to(equal(0))
                expect("0a".to_i).to(equal(0))
                expect("hello".to_i).to(equal(0))
            }
        }
        
        describe(".oct") { 
            it("returns a oct integer from str") {
                expect("123".oct).to(equal(83))
                expect("-377".oct).to(equal(-255))
                expect("377bad".oct).to(equal(255))
                expect("bad".oct).to(equal(0))
            }
        }
        
        describe(".ord") { 
            it("Return the Integer ordinal of a one-character string") {
                expect("a".ord).to(equal(97))
                expect("ab".ord).to(equal(97))
                expect("b".ord).to(equal(98))
            }
        }
        
        describe(".hex") { 
            it("returns a hex integer from str") {
                expect("-".hex).to(equal(0))
                expect("0xa".hex).to(equal(10))
                expect("-0xa".hex).to(equal(-10))
                expect("a".hex).to(equal(10))
            }
        }
        
        describe(".to_double") {
            it("returns an float under different circumstances") {
                expect("0a".to_double).to(equal(0))
                expect("1100101.11".to_double).to(equal(1100101.11))
                expect("123.456".to_double).to(equal(123.456))
                expect("123.456ddddd".to_double).to(equal(123.456))
                expect(".456ddddd".to_double).to(equal(0.456))
            }
            
            it("returns zero if format is invalid") {
                expect("-".to_double).to(equal(0))
                expect("d-1".to_double).to(equal(0))
                expect("0a".to_double).to(equal(0))
                expect("..12".to_double).to(equal(0))
                expect("hello".to_double).to(equal(0))
            }
        }
        
        describe(".to_datetime") {
            it("returns a Date with RFC2822 form") {
                let date = "Sun Mar 19 01:04:21 2017".to_datetime!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(1))
                expect(date.minute).to(equal(4))
                expect(date.second).to(equal(21))
            }
            
            it("returns a Date with custom form") {
                let date = "2017-03-19 00:35:36 +0800".to_datetime!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(0))
                expect(date.minute).to(equal(35))
                expect(date.second).to(equal(36))
            }
        }
    }
}

