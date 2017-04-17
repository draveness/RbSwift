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

class ArrayAccessSpec: BaseSpec {
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
        
        describe(".shuffle") {
            it("returns a new array with elements of self shuffled.") {
                let arr = [1, 2, 3]
                expect(arr.shuffle.count).to(equal(3))
                expect(arr.shuffle.sorted { $0 < $1 }).to(equal([1,2,3]))
            }
        }
        
        describe(".from(position:)") {
            it("returns the tail of the array from the `position`") {
                expect(["a", "b", "c", "d"].from(0)).to(equal(["a", "b", "c", "d"]))
                expect(["a", "b", "c", "d"].from(2)).to(equal(["c", "d"]))
                expect(["a", "b", "c", "d"].from(10)).to(equal([]))
                expect([].from(0).isEmpty).to(beTrue())
                expect(["a", "b", "c", "d"].from(-2)).to(equal(["c", "d"]))
                expect(["a", "b", "c"].from(-10)).to(equal([]))
            }
        }
        
        describe(".to(position:)") {
            it("returns the tail of the array from the `position`") {
                expect(["a", "b", "c", "d"].to(0)).to(equal(["a"]))
                expect(["a", "b", "c", "d"].to(2)).to(equal(["a", "b", "c"]))
                expect(["a", "b", "c", "d"].to(10)).to(equal(["a", "b", "c", "d"]))
                expect([].to(0).isEmpty).to(beTrue())
                expect(["a", "b", "c", "d"].to(-2)).to(equal(["a", "b", "c"]))
                expect(["a", "b", "c"].to(-10)).to(equal([]))
            }
        }
        
        describe(".without(elements:)") {
            it("returns a copy of the Array without the specified elements.") {
                let people = ["David", "Rafael", "Aaron", "Todd"]
                expect(people.without("David", "Aaron")).to(equal(["Rafael", "Todd"]))
            }
        }
    }
}
