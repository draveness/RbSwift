//
//  ArrayPatchSpec.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayPatchSpec: QuickSpec {
    
    override func spec() {
        describe(".take(count:)") {
            it("returns the first count element of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.take(1)).to(equal([1]))
                expect(arr.take(2)).to(equal([1, 2]))
            }
            
            it("returns a new array with the same element if count is greater than array.count") {
                let arr = [1, 2, 3, 4]
                expect(arr.take(6)).to(equal([1, 2, 3, 4]))
            }
        }
        
        describe(".&") { 
            it("returns a new array containing elements common to the two arrays, excluding any duplicates") {
                let arr1 = [1, 1, 3, 5]
                let arr2 = [1, 2, 3]
                expect(arr1 & arr2).to(equal([1, 3]))

                let arr3 = ["a", "b", "c", "d"]
                let arr4 = ["b", "c", "d", "e"]
                expect(arr3 & arr4).to(equal(["b", "c", "d"]))
            }
        }
        
        describe(".*") {
            it("returns a new array built by concatenating the int copies of self") {
                let arr = [1, 2, 3]
                expect(arr * 2).to(equal([1, 2, 3, 1, 2, 3]))
            }
            
            context("when passing a string as a parameter") {
                it("behaves like a join(separator:)") {
                    let arr = [1, 2, 3]
                    expect(arr * ", ").to(equal("1, 2, 3"))
                }
            }
        }
        
        describe(".==") {
            it("returns true if the elements of both arrays are exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 1]
                expect(arr1.isEqual(arr2)).to(beTrue())
            }
            
            it("returns false if the elements of both arrays are not exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 2]
                expect(arr1.isEqual(arr2)).to(beFalse())
                
                let arr3 = [1, 2, 3, 4]
                let arr4 = [1, 2, 3]
                expect(arr3.isEqual(arr4)).to(beFalse())
            }

        }
        
        describe("isAny(closure:)") {
            it("returns true if array contains specific object") {
                expect([1, 2, 3].isAny(obj: 1)).to(beTrue())
                expect(["a", "b", "c"].isAny(obj: "b")).to(beTrue())
            }

            it("returns true if array does not contain specific") {
                expect([1, 2, 3].isAny(obj: 100)).to(beFalse())
                expect(["a", "b", "c"].isAny(obj: "bbbb")).to(beFalse())
            }
        }

        describe(".clear") {
            it("makes the array empty") {
                var s = [1, 2, 3]
                expect(s.clear()).to(equal([]))
            }
        }
        
        describe(".isStartWith(substring:)") {
            it("starts with substring") {
                expect("hello".isStartWith("he")).to(beTrue())
                expect("hello".isStartWith(["hepp", "h"])).to(beTrue())
            }
        }
        
        describe(".isEndWith(substring:)") {
            it("ends with substring") {
                expect("hello".isEndWith("lo")).to(beTrue())
                expect("hello".isEndWith(["loldada", "ello"])).to(beTrue())
                expect("hello".isEndWith(["loldada", "ellos"])).to(beFalse())
            }
        }
        
        describe(".isInclude(substring:)") {
            it("includes substring") {
                expect("hello".isInclude("lo")).to(beTrue())
                expect("hello".isInclude("11")).to(beFalse())
                expect("hello".isInclude(["11", "h"])).to(beTrue())
            }
        }
        
        describe(".delete") { 
            it("deletes and returns all the object if found") {
                var arr1 = [1, 2, 3]
                expect(arr1.delete(1)!).to(equal(1))
                expect(arr1).to(equal([2, 3]))

                var arr2 = [1, 2, 3, 1, 1]
                expect(arr2.delete(1)!).to(equal(1))
                expect(arr2).to(equal([2, 3]))
            }
            
            it("deletes and return the first object if flag all is false") {
                var arr = [1, 2, 3, 1, 1]
                expect(arr.delete(1, all: false)!).to(equal(1))
                expect(arr).to(equal([2, 3, 1, 1]))
            }
            
            it("returns nil if found nothing") {
                var arr1 = [1, 2, 3]
                expect(arr1.delete(4)).to(beNil())
                expect(arr1).to(equal([1, 2, 3]))
            }
        }
        
        describe(".combination(num:)") {
            it("creates a new array containing the values returned by the block") {
                expect([1, 2, 3].combination(1).flatMap { $0 }).to(equal([[1], [2], [3]].flatMap { $0 }))
                expect([1, 2, 3].combination(2).flatMap { $0 }).to(equal([[1, 2], [1, 3], [2, 3]].flatMap { $0 }))
                expect([1, 2, 3].combination(3).flatMap { $0 }).to(equal([[1, 2, 3]].flatMap { $0 }))
                expect([1, 2, 3].combination(0).flatMap { $0 }).to(equal([].flatMap { $0 }))
                expect([1, 2, 3].combination(5).flatMap { $0 }).to(equal([[]].flatMap { $0 }))
            }
        }
        
        describe(".cycle(times:)") {
            it("returns a new array built by concatenating the int copies of self") {
                let arr = [1, 2, 3]
                expect(arr.cycle(2)).to(equal([1, 2, 3, 1, 2, 3]))
            }
        }
        
//        describe(".dig(idxs:)") { 
//            it("extracts the nested value specified by the sequence of idx objects by calling dig at each step") {
//                let arr = [[1, 2, 3], [3, 4, 5]]
//                expect(arr.dig(1, 2)).to(equal(5))
//            }
//        }
    }
}