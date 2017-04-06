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
    }
}
