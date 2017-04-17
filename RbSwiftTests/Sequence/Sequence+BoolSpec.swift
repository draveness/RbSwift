//
//  Sequence+BoolSpec.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequenceBoolSpec: BaseSpec {
    override func spec() {
        describe("isAny(closure:)") {
            it("returns true if array has an element satisfy specific condition") {
                expect([1, 2, 3].isAny { $0 == 1 }).to(beTrue())
                expect(["a", "b", "c"].isAny { $0 == "b" }).to(beTrue())
            }
            
            it("returns true if any element of the array satisfy specific condition") {
                expect([1, 2, 3].isAny { $0 == 100 }).to(beFalse())
                expect(["a", "b", "c"].isAny { $0 == "bbb" }).to(beFalse())
            }
        }
        
        describe("isAll(closure:)") {
            it("returns true if all the element in array satisfy specific condition") {
                expect([1, 2, 3].isAll { $0.isPositive }).to(beTrue())
                expect(["a", "a", "a"].isAll { $0 == "a" }).to(beTrue())
            }
            
            it("returns true if some of the element in array does not satify specific condition") {
                expect([1, 2, 3].isAll { $0 == 100 }).to(beFalse())
                expect(["a", "b", "c"].isAll { $0 == "bbb" }).to(beFalse())
            }
        }
    }
}

