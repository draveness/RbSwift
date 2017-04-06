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
                expect(h1.isAny { $0 == "a" }).to(beTrue())
                expect(h1.isAny { $0 == "c" }).to(beFalse())
            }
        }
    }
}
