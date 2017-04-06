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

class HashBoolSpec: QuickSpec {
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
        
        describe("hasKey(key:)") {
            it("returns true if the given key is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.hasKey("a")).to(beTrue())
                expect(hash.hasKey("c")).to(beFalse())
            }
        }
        
        describe("isMember(key:)") {
            it("returns true if the given key is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.isMember("a")).to(beTrue())
                expect(hash.isMember("c")).to(beFalse())
            }
        }
        
        describe("hasValue(value:)") {
            it("returns true if the given value is present in hsh.") {
                let hash = ["a": 100, "b": 200]
                expect(hash.hasValue(100)).to(beTrue())
                expect(hash.hasValue(2000)).to(beFalse())
            }
        }
    }
}
