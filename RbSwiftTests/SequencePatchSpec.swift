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

class SequencePatchSpec: QuickSpec {
    
    override func spec() {
        describe(".select(closure:)") {
            it("returns a new array containing all elements of ary for which the given block returns a true value") {
                expect([1, 2, 3].select { $0 > 2 }).to(equal([3]))
                expect([1, 2, 3].select { $0 <= 2 }).to(equal([1, 2]))
                expect([1, 2, 3].select { _ in false }).to(equal([]))
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
        
        describe(".length") {
            it("returns the length of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.length).to(equal(arr.count))
            }
        }
        
        describe(".size") {
            it("returns the length of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.size).to(equal(arr.count))
            }
        }
        
        describe(".count") {
            it("returns the length of array according to specific condition") {
                let arr = [1, 2, 3, 4]
                expect(arr.count { $0.isEven }).to(equal(2))
            }
        }
    }
}
