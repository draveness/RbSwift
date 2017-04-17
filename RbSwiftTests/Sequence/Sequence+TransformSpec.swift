
//  SequencePatchSpec.swift
//  SwiftPatch
//
//  Created by Draveness on 17/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequencTransformSpec: BaseSpec {
    
    override func spec() {
        describe(".select(closure:)") {
            it("returns a new array containing all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].select { $0 > 2 }).to(equal([3]))
                expect([1, 2, 3].select { $0 <= 2 }).to(equal([1, 2]))
                expect([1, 2, 3].select { _ in false }).to(equal([]))
            }
        }
        
        describe(".keepIf(closure:)") {
            it("returns a new array containing all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].keepIf { $0 > 2 }).to(equal([3]))
                expect([1, 2, 3].keepIf { $0 <= 2 }).to(equal([1, 2]))
                expect([1, 2, 3].keepIf { _ in false }).to(equal([]))
            }
        }
        
        describe(".reject(closure:)") {
            it("returns a new array excluding all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].reject { $0 > 2 }).to(equal([1, 2]))
                expect([1, 2, 3].reject { $0 <= 2 }).to(equal([3]))
                expect([1, 2, 3].reject { _ in false }).to(equal([1, 2, 3]))
            }
        }
        
        describe(".deleteIf(closure:)") {
            it("deletes every element of self for which block evaluates to true.") {
                expect([1, 2, 3].deleteIf { $0 > 2 }).to(equal([1, 2]))
                expect([1, 2, 3].deleteIf { $0 <= 2 }).to(equal([3]))
                expect([1, 2, 3].deleteIf { _ in false }).to(equal([1, 2, 3]))
            }
        }
        
        describe(".dropWhile(closure:)") {
            it("drops elements up to, but not including, the first element for which the block returns nil or false and returns an array containing the remaining elements") {
                expect([1, 2, 3].dropWhile { $0 > 2 }.to_a).to(equal([1, 2, 3]))
                expect([1, 2, 3].dropWhile { $0 <= 2 }.to_a).to(equal([3]))
                expect([1, 2, 3].dropWhile { _ in false }.to_a).to(equal([1, 2, 3]))
            }
        }
        
        describe(".takeWhile(closure:)") {
            it("passes elements to the block until the block returns nil or false, then stops iterating and returns an array of all prior elements") {
                expect([1, 2, 3].takeWhile { $0 > 2 }.to_a).to(equal([]))
                expect([1, 2, 3].takeWhile { $0 <= 2 }.to_a).to(equal([1, 2]))
                expect([1, 2, 3].takeWhile { _ in false }.to_a).to(equal([]))
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
        
        describe(".count(closure:)") {
            it("returns the number of element satisfy specific closure") {
                let a = [1, 2, 3, 10, 100, 1000]
                expect(a.count { $0 > 10 }).to(equal(2))
                expect(a.count { $0.isPositive }).to(equal(6))
                expect(a.count { $0.isEven }).to(equal(4))
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
        
        describe(".last(num:)") {
            it("returns the last count element of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.last(1)).to(equal([4]))
                expect(arr.last(2)).to(equal([3, 4]))
            }
            
            it("returns a new array with the same element if count is greater than array.count") {
                expect([1, 2, 3, 4].last(6)).to(equal([1, 2, 3, 4]))
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
        
        describe(".cycle(times:)") {
            it("returns a new array built by concatenating the int copies of self") {
                let arr = [1, 2, 3]
                expect(arr.cycle(2)).to(equal([1, 2, 3, 1, 2, 3]))
                
                var result: [Int] = []
                arr.cycle(2) { result.append($0) }
                expect(result).to(equal([1, 2, 3, 1, 2, 3]))
            }
        }
        
        describe(".zip(arrays:)") {
            it("returns a new array built by concatenating the int copies of self") {
                let arr = Array([1, 2, 3].zip([3, 4, 5]).joined())
                expect(arr).to(equal([1, 3, 2, 4, 3, 5]))
                
                let arr1 = Array([1, 2, 3].zip([4, 5, 6], [7, 8, 9]).joined())
                expect(arr1).to(equal([1, 4, 7, 2, 5, 8, 3, 6, 9]))
                
                let arr2 = Array([1, 2, "a"].zip([4, 5, "b"], [7, 8, "c"]).joined())
                let intArray = arr2.first(6) as! [Int]
                let strArray = arr2.drop(6) as! [String]
                expect(intArray).to(equal([1, 4, 7, 2, 5, 8]))
                expect(strArray).to(equal(["a", "b", "c"]))
            }
        }
    }
}
