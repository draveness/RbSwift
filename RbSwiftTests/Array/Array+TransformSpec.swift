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
        describe(".combination(num:)") {
            it("creates a new array containing the values returned by the block") {
                expect([1, 2, 3].combination(1).flatMap { $0 }).to(equal([[1], [2], [3]].flatMap { $0 }))
                expect([1, 2, 3].combination(2).flatMap { $0 }).to(equal([[1, 2], [1, 3], [2, 3]].flatMap { $0 }))
                expect([1, 2, 3].combination(3).flatMap { $0 }).to(equal([[1, 2, 3]].flatMap { $0 }))
                expect([1, 2, 3].combination(0).flatMap { $0 }).to(equal([].flatMap { $0 }))
                expect([1, 2, 3].combination(5).flatMap { $0 }).to(equal([[]].flatMap { $0 }))
            }
        }
        
        describe(".repeatedCombination(num:)") {
            it("creates a new array containing the values returned by the block") {
                expect([1, 2, 3].repeatedCombination(1).flatMap { $0 }).to(equal([[1], [2], [3]].flatMap { $0 }))
                expect([1, 2, 3].repeatedCombination(2).flatMap { $0 }).to(equal([[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]].flatMap { $0 }))
                expect([1, 2, 3].repeatedCombination(3).flatMap { $0 }).to(equal([[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],[1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]].flatMap { $0 }))
//                expect([1, 2, 3].repeatedCombination(4).flatMap { $0 }).to(equal([[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,2],[1,1,2,3],[1,1,3,3],[1,2,2,2],[1,2,2,3],[1,2,3,3],[1,3,3,3], [2,2,2,2],[2,2,2,3],[2,2,3,3],[2,3,3,3],[3,3,3,3]].flatMap { $0 }))
                expect([1, 2, 3].repeatedCombination(0).flatMap { $0 }).to(equal([].flatMap { $0 }))
            }
        }
        
        describe(".dig(idxs:)") {
            it("extracts the nested value specified by the sequence of idx objects by calling dig at each step") {
                let arr = [[1, 2, 3], [3, 4, 5]]
                expect(arr.dig(1, 2)).to(equal(5))
                expect(arr.dig(1)).to(equal([3, 4, 5]))

                let result1: Int? = arr.dig(1, 2, 3)
                expect(result1).to(beNil())
                
                let result2: Int? = arr.dig(10, 2, 3)
                expect(result2).to(beNil())
            }
        }
    }
}
