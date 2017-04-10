//
//  Hash+MutateSpec.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashMutateSpec: QuickSpec {
    override func spec() {
        describe(".store(key:value:)") { 
            it("associates the value given by value with the key given by key.") {
                var hash = ["a": 4]
                expect(hash.store("b", 5)).to(equal(5))
                expect(hash).to(equal(["a": 4, "b": 5]))
            }
        }
    }
}
