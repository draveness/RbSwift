//
//  Sequence+EquatableSpec.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequenceEquatableSpec: BaseSpec {
    override func spec() {
        describe(".index(elem:)") {
            it("returns the first index of element in array") {
                expect([1, 2, 3].index(1)).to(equal(0))
                expect([1, 2, 3].index(2)).to(equal(1))
                expect([1, 2, 3, 3, 4].index(3)).to(equal(2))
            }
        }
        
        describe(".rindex(elem:)") {
            it("returns the last index of element in array") {
                expect([1, 2, 3].rindex(1)).to(equal(0))
                expect([1, 2, 3].rindex(2)).to(equal(1))
                expect([1, 2, 3, 3, 4].rindex(3)).to(equal(3))
            }
        }
    }
}

