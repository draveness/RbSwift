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

class SequenceEquatableSpec: QuickSpec {
    override func spec() {
        describe(".length") {
            it("returns the length of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.length).to(equal(arr.count))
            }
        }
    }
}

