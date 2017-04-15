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
        
        describe(".except(keys:)") {
            it("returns a hash that includes everything except given keys.") {
                let hash = [1: "one", 2: "two", 3: "three"]
                expect(hash.except(1, 2)).to(equal([3: "three"]))
                expect(hash).to(equal([1: "one", 2: "two", 3: "three"]))
            }
            
            it("removes the given keys from hash and returns it.") {
                var hash = [1: "one", 2: "two", 3: "three"]
                expect(hash.excepted(1, 2)).to(equal([3: "three"]))
                expect(hash).to(equal([3: "three"]))
            }
        }
        
        describe(".extract(keys:)") {
            it("removes and returns the key/value pairs matching the given keys.") {
                var hash1 = [1: "one", 2: "two", 3: "three"]
                expect(hash1.extract(1, 2)).to(equal([1: "one", 2: "two"]))
                expect(hash1).to(equal([3: "three"]))
                
                var hash2 = [1: "one", 2: "two", 3: "three"]
                expect(hash2.extract([1, 4])).to(equal([1: "one"]))
                expect(hash2).to(equal([2: "two", 3: "three"]))
            }
        }
    }
}
