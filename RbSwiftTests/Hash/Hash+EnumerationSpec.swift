//
//  Hash+EnumerationSpec.swift
//  RbSwift
//
//  Created by draveness on 07/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashEnumerationSpec: QuickSpec {
    override func spec() {
        describe(".eachPair(closure:)") {
            it("calls block once for each key in hsh, passing the key-value pair as parameters.") {
                let hash = ["a": 100, "b": 200]
                var result: [String: Int] = [:]
                expect(hash.eachPair {
                    result[$0] = $1 + 100
                }).to(equal(hash))
                expect(result).to(equal(["a": 200, "b": 300]))
            }
        }
        
        describe(".eachKey(closure:)") {
            it("calls block once for each key in hsh, passing the key as parameters.") {
                let hash = ["a": 100, "b": 200]
                var result: [String] = []
                expect(hash.eachKey {
                    result.append($0)
                }).to(equal(hash))
                expect(result).to(equal(["a", "b"]))
            }
        }
        
        describe(".eachValue(closure:)") {
            it("calls block once for each key in hsh, passing the value as parameters.") {
                let hash = ["a": 100, "b": 200]
                var result: [Int] = []
                expect(hash.eachValue {
                    result.append($0)
                }).to(equal(hash))
                expect(result).to(equal([100, 200]))
            }
        }
    }
}
