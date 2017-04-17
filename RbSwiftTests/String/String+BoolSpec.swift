//
//  Bool.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringBoolSpec: BaseSpec {
    override func spec() {
        describe(".isEmpty") {
            it("returns true when length is zero") {
                expect("".isEmpty).to(beTrue())
            }
            
            it("returns false when length is not zero") {
                expect(" ".isEmpty).to(beFalse())
                expect("111 ".isEmpty).to(beFalse())
            }
        }
        
        describe(".isBlank") {
            it("is blank if it's empty or contains whitespaces only") {
                expect("  ".isBlank).to(beTrue())
                expect("\t\n\r\n".isBlank).to(beTrue())
                expect("\t\nblah".isBlank).to(beFalse())
            }
        }

        describe(".isUpcase") {
            it("returns true it string's chars are all upcase") {
                expect("HELLO".isUpcase).to(beTrue())
                expect("HELLOo".isUpcase).to(beFalse())
            }
        }
        
        describe(".isDowncase") {
            it("returns true it string's chars are all downcase") {
                expect("HELLO".isDowncase).to(beFalse())
                expect("HELLOo".isDowncase).to(beFalse())
                expect("hello".isDowncase).to(beTrue())
            }
        }
        
        describe(".isExclude(substring:)") {
            it("returns true if the string does not include the other string.") {
                expect("  ".isExlude("he")).to(beTrue())
                expect("he".isExlude("he")).to(beFalse())
                expect("ohe".isExlude("he")).to(beFalse())
                expect("ohe".isExlude("he", "oooo")).to(beFalse())
                expect("oe".isExlude("he", "dajkldjda")).to(beTrue())
            }
        }
        
        describe(".isInclude(substring:)") {
            it("returns true if the string includes the other string.") {
                expect("  ".isInclude("he")).to(beFalse())
                expect("he".isInclude("he")).to(beTrue())
                expect("ohe".isInclude("he")).to(beTrue())
                expect("ohe".isInclude("he", "oooo")).to(beTrue())
                expect("oe".isInclude("he", "dajkldjda")).to(beFalse())
            }
        }
        
        describe(".isStartWith(substring:)") {
            it("returns true if the string starts with the other string.") {
                expect("he".isStartWith("he")).to(beTrue())
                expect("ohe".isStartWith("he", "oooo")).to(beFalse())
                expect("oe".isStartWith("o", "dajkldjda")).to(beTrue())
            }
        }
        
        describe(".isEndWith(substring:)") {
            it("returns true if the string ends with the other string.") {
                expect("  ".isEndWith("he")).to(beFalse())
                expect("he".isEndWith("he")).to(beTrue())
                expect("ohe".isEndWith("he")).to(beTrue())
                expect("ohe".isEndWith("he", "oooo")).to(beTrue())
                expect("oe".isEndWith("he", "dajkldjda")).to(beFalse())
            }
        }
        
        describe(".isMatch(substring:)") {
            it("returns true if the string matches the other string.") {
                expect("  ".isMatch("he")).to(beFalse())
                expect("he".isMatch("he")).to(beTrue())
                expect("ohe".isMatch("he", 2)).to(beFalse())
                expect("oe".isMatch("he")).to(beFalse())
                expect("oe".isMatch(".e")).to(beTrue())
                expect("abcdefghijklmnopqrstuvwxyz".isMatch(".*")).to(beTrue())
            }
        }
    }
}

