//
//  Array+GroupingSpec.swift
//  RbSwift
//
//  Created by draveness on 15/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayGroupingSpec: QuickSpec {
    override func spec() {
        describe(".inGroups(of:with:)") {
            it("splits or iterates over the array in groups of size number") {
                let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                expect(arr.inGroup(of: 0) == []).to(beTrue())
                expect(arr.inGroup(of: 3) == [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]).to(beTrue())
                expect(arr.inGroup(of: 4) == [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10]]).to(beTrue())
                expect(arr.inGroup(of: 4, fill: 0) == [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 0, 0]]).to(beTrue())
            }
        }
        
        describe(".inGroups(_:with:)") {
            it("splits or iterates over the array in groups of size number") {
                let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                expect(arr.inGroup(0) == []).to(beTrue())
                expect(arr.inGroup(3) == [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]]).to(beTrue())
                expect(arr.inGroup(4) == [[1, 2, 3], [4, 5, 6], [7, 8], [9, 10]]).to(beTrue())
                expect(arr.inGroup(4, fill: 0) == [[1, 2, 3], [4, 5, 6], [7, 8, 0], [9, 10, 0]]).to(beTrue())
            }
        }
        
        describe(".split(value:)") {
            it("splits or iterates over the array in groups of size number") {
                let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                expect(arr.split(3) == [[1, 2], [4, 5, 6, 7, 8, 9, 10]]).to(beTrue())
                expect(arr.split { $0 % 3 == 0 } == [[1, 2], [4, 5], [7, 8], [10]]).to(beTrue())
            }
        }
    }
}
