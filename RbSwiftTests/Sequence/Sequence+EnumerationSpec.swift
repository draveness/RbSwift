//
//  Sequence+EnumerationSpec.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequenceEnumerationSpec: QuickSpec {
    override func spec() {
        describe(".each(closure:)") {
            it("is an alias to forEach(body:)") {
                var result: [Int] = []
                [1, 2, 3].each {
                    result.append($0)
                }
                expect(result).to(equal([1, 2, 3]))
            }
        }
        
        describe(".eachWithIndex(closure:)") {
            it("is an alias to forEach(body:) with index") {
                var indexes: [Int] = []
                var result: [Int] = []
                [10, 20, 30].eachWithIndex {
                    indexes.append($0)
                    result.append($1)
                }
                expect(indexes).to(equal([0, 1, 2]))
                expect(result).to(equal([10, 20, 30]))
            }
        }
        
        describe(".mapWithIndex(closure:)") {
            it("is an alias to forEach(body:) with index") {
                var indexes: [Int] = []
                let result = [10, 20, 30].mapWithIndex { (index, value) -> Int in
                    indexes.append(index)
                    return 1000
                }
                expect(indexes).to(equal([0, 1, 2]))
                expect(result).to(equal([1000, 1000, 1000]))
            }
        }
        
        describe(".reverseEach(closure:)") {
            it("is an alias to forEach(body:)") {
                var result: [Int] = []
                [1, 2, 3].reverseEach {
                    result.append($0)
                }
                expect(result).to(equal([3, 2, 1]))
            }
        }
        
        describe(".withIndex") {
            it("returns an enumerated seqeuence") {
                var indexes: [Int] = []
                var result: [Int] = []
                for (index, element) in [10, 20, 30].withIndex {
                    indexes.append(index)
                    result.append(element)
                }
                expect(indexes).to(equal([0, 1, 2]))
                expect(result).to(equal([10, 20, 30]))
            }
        }
    }
}
