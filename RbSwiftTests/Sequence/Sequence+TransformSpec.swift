//
//  SequencePatchSpec.swift
//  SwiftPatch
//
//  Created by Draveness on 17/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequencTransformSpec: QuickSpec {
    
    override func spec() {
        describe(".select(closure:)") {
            it("returns a new array containing all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].select { $0 > 2 }).to(equal([3]))
                expect([1, 2, 3].select { $0 <= 2 }).to(equal([1, 2]))
                expect([1, 2, 3].select { _ in false }).to(equal([]))
            }
        }
        
        describe(".reject(closure:)") {
            it("returns a new array excluding all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].reject { $0 > 2 }).to(equal([1, 2]))
                expect([1, 2, 3].reject { $0 <= 2 }).to(equal([3]))
                expect([1, 2, 3].reject { _ in false }).to(equal([1, 2, 3]))
            }
        }
        
        describe(".collect(closure:)") {
            it("creates a new array containing the values returned by the block") {
                expect([1, 2, 3].collect { _ in "2" }).to(equal(["2", "2", "2"]))
                expect([1, 2, 3].collect { $0 * 2 }).to(equal([2, 4, 6]))
                expect(["1", "2", "3"].collect { $0 + "!" }).to(equal(["1!", "2!", "3!"]))
            }
        }
        
        describe(".compact") {
            it("removes all the nil in the arary") {
                let a: Int? = 3
                expect([1, 2, a].compact).to(equal([1, 2, 3]))
                let b: Int? = nil
                expect([1, nil, 2, b].compact).to(equal([1, 2]))
            }
        }
        
        describe(".concat(other:)") {
            it("appends the elements of other to self") {
                let a = [1, 2, 3]
                expect(a.concat([4, 5, 6])).to(equal([1, 2, 3, 4, 5, 6]))
                expect(a).to(equal([1, 2, 3]))
            }
        }
        
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
        
        describe(".flatten()") { 
            it("returns a new array that is one-dimentional of self") {
                expect([1, 2, [3, 4, 5, [6, 7, [8]]]].flatten()).to(equal([1, 2, 3, 4, 5, 6, 7, 8]))
            }
        }
        
        describe(".take(num:)") {
            it("returns the first count element of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.take(1)).to(equal([1]))
                expect(arr.take(2)).to(equal([1, 2]))
                
                let arr1 = [1, 2 ,3]
                expect(arr1.take(1)).to(equal([1]))
                expect(arr1.take(2)).to(equal([1, 2]))
            }
            
            it("returns a new array with the same element if count is greater than array.count") {
                expect([1, 2, 3, 4].take(6)).to(equal([1, 2, 3, 4]))
                expect([1, 2, 3].take(100)).to(equal([1, 2, 3]))
            }
        }
        
        describe(".first(num:)") {
            it("returns the first count element of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.first(1)).to(equal([1]))
                expect(arr.first(2)).to(equal([1, 2]))
            }
            
            it("returns a new array with the same element if count is greater than array.count") {
                expect([1, 2, 3, 4].first(6)).to(equal([1, 2, 3, 4]))
            }
        }
        
        describe(".drop(num:)") {
            it("drops the first n element of array") {
                let arr = [1, 2, 3]
                expect(arr.drop(1)).to(equal([2, 3]))
                expect(arr.drop(2)).to(equal([3]))
                expect(arr.drop(100)).to(equal([]))
            }
        }
    }
}
