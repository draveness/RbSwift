//
//  Number+ExpontionSpec.swift
//  RbSwift
//
//  Created by Draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberExponentiativeSpec: BaseSpec {
    override func spec() {
        describe(".**") { 
            it("performs correctly") {
                expect(1 ** 2).to(equal(1))
                expect(2 ** 2).to(equal(4))
                expect(-2 ** 2).to(equal(4))
                expect(-(2 ** 2)).to(equal(-4))
                expect(-2 ** 0).to(equal(1))
            }
        }
    }
}
