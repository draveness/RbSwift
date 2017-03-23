//
//  Array+MutateSpec.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayMutateSpec: QuickSpec {
    
    override func spec() {
        describe(".clear") {
            it("makes the array empty") {
                var s = [1, 2, 3]
                expect(s.clear()).to(equal([]))
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
    }
}
