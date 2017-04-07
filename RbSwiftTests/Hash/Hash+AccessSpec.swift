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
        
        describe(".assoc(key:)") {
            it("returns the first key-value pair (two-element array) that matches with given key.") {
                let hash = [1: "one", 2: "two", 3: "three"]
                expect(hash.assoc(1)!.0).to(equal(1))
                expect(hash.assoc(1)!.1).to(equal("one"))
                expect(hash.assoc(100)).to(beNil())
            }
        }
        
        describe(".rassoc(value:)") {
            it("returns the first key-value pair (two-element array) that matches with given value.") {
                let hash = [1: "one", 2: "two", 3: "three"]
                expect(hash.rassoc("one")!.0).to(equal(1))
                expect(hash.rassoc("one")!.1).to(equal("one"))
                expect(hash.rassoc("forty-two")).to(beNil())
            }
        }
    }
}
