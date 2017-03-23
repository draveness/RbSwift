//
//  Array+ConversionsSpec.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayConversionsSpec: QuickSpec {
    override func spec() {
        describe(".to_i(base:)") {
            it("returns an integer") {
                expect([1,2,3].to_i()).to(equal(321))
                expect([1,2,3,4].to_i()).to(equal(4321))
                expect([0,0,0,1].to_i(2)).to(equal(8))
            }
        }
    }
}
