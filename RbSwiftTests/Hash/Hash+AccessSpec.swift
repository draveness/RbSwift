//
//  Hash+AccessSpec.swift
//  RbSwift
//
//  Created by Draveness on 07/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashAccessSpec: QuickSpec {
    override func spec() {
        describe(".values(at:)") {
            it("returns an array of optinal value with given keys.") {
                let hash = ["cat": "feline", "dog": "canine", "cow": "bovine"]
                expect(hash.values(at: "cat", "dog")).to(equal(["feline", "canine"]))
                expect(hash.values(at: "catcat", "dog")).to(equal([nil, "canine"]))
            }
        }
    }
}
