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
        
        describe(".pop(num:)") {
            it("returns the last element in array or nil") {
                var arr = [1, 2, 3]
                expect(arr.pop()).to(equal(3))
                expect(arr).to(equal([1, 2]))
                
                var arr1: [Int] = []
                expect(arr1.pop()).to(beNil())
                expect(arr1).to(equal([]))
                
                var arr2 = [1, 2, 3]
                expect(arr2.pop(2)).to(equal([2, 3]))
                expect(arr2).to(equal([1]))
                
                var arr3 = [1, 2, 3]
                expect(arr3.pop(-1)).to(equal([]))
                expect(arr3).to(equal([1, 2, 3]))
                
                var arr4 = [1, 2, 3]
                expect(arr4.pop(4)).to(equal([1, 2, 3]))
                expect(arr4).to(equal([]))
            }
        }
        
        describe(".push(objs:)") {
            it("prepends objects to the front of self, moving other elements upwards.") {
                var arr = [1, 2, 3]
                expect(arr.push(1)).to(equal([1, 2, 3, 1]))
                expect(arr).to(equal([1, 2, 3, 1]))
                
                var arr1: [Int] = [1]
                expect(arr1.push(1, 2, 3)).to(equal([1, 1, 2, 3]))
                expect(arr1).to(equal([1, 1, 2, 3]))
                
            }
        }

        describe(".shift(num:)") {
            it("returns the first element in array or nil") {
                var arr = [1, 2, 3]
                expect(arr.shift()).to(equal(1))
                expect(arr).to(equal([2, 3]))
                
                var arr1: [Int] = []
                expect(arr1.shift()).to(beNil())
                expect(arr1).to(equal([]))
                
                var arr2 = [1, 2, 3]
                expect(arr2.shift(2)).to(equal([1, 2]))
                expect(arr2).to(equal([3]))
                
                var arr3 = [1, 2, 3]
                expect(arr3.shift(-1)).to(equal([]))
                expect(arr3).to(equal([1, 2, 3]))
                
                var arr4 = [1, 2, 3]
                expect(arr4.shift(4)).to(equal([1, 2, 3]))
                expect(arr4).to(equal([]))
            }
        }
        
        describe(".unshift(objs:)") {
            it("prepends objects to the front of self, moving other elements upwards.") {
                var arr = [1, 2, 3]
                expect(arr.unshift(1)).to(equal([1, 1, 2, 3]))
                expect(arr).to(equal([1, 1, 2, 3]))
                
                var arr1: [Int] = [1, 2, 3]
                expect(arr1.unshift(1, 2)).to(equal([1, 2, 1, 2, 3]))
                expect(arr1).to(equal([1, 2, 1, 2, 3]))
                
            }
        }
    }
}
