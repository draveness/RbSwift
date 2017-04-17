//
//  Hash+Bool.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashBoolSpec: BaseSpec {
    override func spec() {
        describe(".isAny(closures:)") {
            it("returns true if the block ever returns a value other than false or nil") {
                let h1 = ["a": 100, "b": 200]
                expect(h1.isAny { (key, _) in key == "a" }).to(beTrue())
                expect(h1.isAny { (key, _) in key == "c" }).to(beFalse())
            }
        }
        
        describe(".isEmpty") {
            it("returns true if count == 0") {
                expect([:].isEmpty).to(beTrue())
                expect([1: 2].isEmpty).to(beFalse())
            }
        }
        
        describe("has(key:)") {
            it("returns true if the given key is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.has(key: "a")).to(beTrue())
                expect(hash.has(key: "c")).to(beFalse())
            }
        }
        
        describe("isMember(key:)") {
            it("returns true if the given key is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.isMember("a")).to(beTrue())
                expect(hash.isMember("c")).to(beFalse())
            }
        }
        
        describe("has(value:)") {
            it("returns true if the given value is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.has(value: 100)).to(beTrue())
                expect(hash.has(value: 2000)).to(beFalse())
            }
        }
    }
}
