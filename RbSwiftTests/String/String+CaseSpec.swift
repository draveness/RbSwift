//
//  Case.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringCaseSpec: QuickSpec {
    override func spec() {
        describe(".downcase") {
            it("returns a copy of str with all lowercase letters replaced with their uppercase counterparts") {
                expect("Hello".downcase).to(equal("hello"))
                expect("HellHEo".downcase).to(equal("hellheo"))
            }
        }
        
        describe(".downcased") {
            it("mutates current string with downcase") {
                var hello = "Hello"
                hello.downcased()
                expect(hello).to(equal("hello"))
            }
        }
        
        describe(".upcase") {
            it("returns a copy of str with all uppercase letters replaced with their lowercase counterparts") {
                expect("Hello".upcase).to(equal("HELLO"))
                expect("HellHEo".upcase).to(equal("HELLHEO"))
            }
        }
        
        describe(".upcased") {
            it("mutates current string with upcase") {
                var hello = "Hello"
                hello.upcased()
                expect(hello).to(equal("HELLO"))
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
        
        describe(".swapcase") {
            it("returns a copy of str with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase") {
                expect("HellHEo".swapcase).to(equal("hELLheO"))
            }
        }
    }
}

