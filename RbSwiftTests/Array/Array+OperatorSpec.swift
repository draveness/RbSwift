//
//  Array+OperatorSpec.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayOperatorSpec: QuickSpec {
    
    override func spec() {
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
            it("returns true when the element in nested array equals including elements order") {
                let value1 = [[1,2],[3,4]] == [[1,2],[3,4]]
                expect(value1).to(beTrue())
                
                let value2 = [[1,2],[3,4]] == [[3,4],[1,2]]
                expect(value2).to(beFalse())
            }
        }
    }
}
