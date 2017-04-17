//
//  ArrayBoolSpec.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayBoolSpec: BaseSpec {
    override func spec() {
        describe(".isEql(other:)") {
            it("returns true if the elements of both arrays are exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 1]
                expect(arr1.isEql(arr2)).to(beTrue())
            }
            
            it("returns false if the elements of both arrays are not exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 2]
                expect(arr1.isEql(arr2)).to(beFalse())
                
                let arr3 = [1, 2, 3, 4]
                let arr4 = [1, 2, 3]
                expect(arr3.isEql(arr4)).to(beFalse())
            }
        }
        
        describe("isInclude(value:)") {
            it("returns true if array contains the element") {
                expect([1, 2, 3].isInclude(1)).to(beTrue())
                expect(["a", "b", "c"].isInclude("b")).to(beTrue())
            }
            
            it("returns false if any element of the array satisfy specific condition") {
                expect([1, 2, 3].isInclude(100)).to(beFalse())
                expect(["a", "b", "c"].isInclude("bbb")).to(beFalse())
            }
        }
    }
}
