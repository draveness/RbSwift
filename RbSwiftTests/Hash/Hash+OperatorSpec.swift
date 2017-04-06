//
//  Hash+OperatorSpec.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class HashOperatorSpec: QuickSpec {
    override func spec() {
        describe(".+") {
            it(("returns a new hash containing the contents of otherHash and the contents of receiver")) {
                let h1 = ["a": 100, "b": 200]
                let h2 = ["b": 254, "c": 300]
                expect(h1 + h2).to(equal(["a": 100, "b": 254, "c": 300]))
            }
        }
    }
}
