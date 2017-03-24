//
//  Array+AccessSpec.swift
//  RbSwift
//
//  Created by draveness on 24/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayAccessSpec: QuickSpec {
    override func spec() {
        describe(".at(num:)") {
            it("returns the specific element or nil in array") {
                expect([1,2,3].at(0)).to(equal(1))
                expect([1,2,3].at(4)).to(beNil())
            }
        }
        
        describe(".sample") {
            it("chooses one random element from the original array") {
                let arr = [1, 2, 3]
                expect(arr).to(contain(arr.sample!))
                expect(arr).to(contain(arr.sample(2)))
                expect(arr).to(contain(arr.sample(3)))
            }
        }
    }
}
