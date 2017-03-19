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

class StringBoolSpec: QuickSpec {
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
        
        describe(".isExclude(substring:)") {
            it("returns true if the string does not include the other string.") {
                expect("  ".isExlude("he")).to(beTrue())
                expect("he".isExlude("he")).to(beFalse())
                expect("ohe".isExlude("he")).to(beFalse())
            }
        }
    }
}

