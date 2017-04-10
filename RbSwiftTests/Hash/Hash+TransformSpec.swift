//
//  Hash+TransformSpec.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashTransformSpec: QuickSpec {
    override func spec() {
        describe(".merge(otherHash:)") {
            it("returns a new hash containing the contents of otherHash and the contents of receiver") {
                let h1 = ["a": 100, "b": 200]
                let h2 = ["b": 254, "c": 300]
                expect(h1.merge(h2)).to(equal(["a": 100, "b": 254, "c": 300]))
                expect(h1.merge(h2) { (key, oldval, newval) in
                    newval - oldval
                }).to(equal(["a": 100, "b": 54,  "c": 300]))
                expect(h1).to(equal(["a": 100, "b": 200]))
            }
        }
        
        describe(".merged(otherHash:)") {
            it("mutates self with a new hash containing the contents of otherHash and the contents of receiver") {
                var h1 = ["a": 100, "b": 200]
                let h2 = ["b": 254, "c": 300]
                expect(h1.merged(h2)).to(equal(["a": 100, "b": 254, "c": 300]))
                expect(h1).to(equal(["a": 100, "b": 254, "c": 300]))
            }
        }
        
        describe(".update(otherHash:)") {
            it("returns a new hash containing the contents of otherHash and the contents of receiver") {
                let h1 = ["a": 100, "b": 200]
                let h2 = ["b": 254, "c": 300]
                expect(h1.update(h2)).to(equal(["a": 100, "b": 254, "c": 300]))
                expect(h1.update(h2) { (key, oldval, newval) in
                    newval - oldval
                }).to(equal(["a": 100, "b": 54,  "c": 300]))
                expect(h1).to(equal(["a": 100, "b": 200]))
            }
        }
        
        describe(".updated(otherHash:)") {
            it("mutates self with a new hash containing the contents of otherHash and the contents of receiver") {
                var h1 = ["a": 100, "b": 200]
                let h2 = ["b": 254, "c": 300]
                expect(h1.updated(h2)).to(equal(["a": 100, "b": 254, "c": 300]))
                expect(h1).to(equal(["a": 100, "b": 254, "c": 300]))
            }
        }
        
        describe(".clear()") {
            it("removes all key value pairs from hash") {
                var hash = ["a": 100]
                expect(hash.clear()).to(equal([:]))
                expect(hash).to(equal([:]))
            }
        }
        
        describe(".delete(key:)") {
            it("deletes the key-value pair and returns the value from hsh whose key is equal to key.") {
                var hash = ["a": 100, "b": 200]
                expect(hash.delete("a")).to(equal(100))
                expect(hash).to(equal(["b": 200]))
            }
        }
        
        describe(".replace(otherHash:)") {
            it("replaces the contents of hsh with the contents of other_hash.") {
                var hash = ["a": 100, "b": 200]
                expect(hash.replace(["c": 300])).to(equal(["c": 300]))
                expect(hash).to(equal(["c": 300]))
            }
        }
        
        describe(".store(key:value:)") {
            it("associates the value given by value with the key given by key.") {
                var hash = ["a": 4]
                expect(hash.store("b", 5)).to(equal(5))
                expect(hash).to(equal(["a": 4, "b": 5]))
            }
        }
        
        describe(".shift()") {
            it("associates the value given by value with the key given by key.") {
                var hash = ["a": 4]
                let result = hash.shift()!
                expect(result.0).to(equal("a"))
                expect(result.1).to(equal(4))
                expect(hash.shift()).to(beNil())
            }
        }
    }
}
