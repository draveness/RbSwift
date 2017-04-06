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
            it("returns timezone with static variable") {
                expect(TimeZone.utc).to(equal(TimeZone(abbreviation: "UTC")!))
                expect(TimeZone.gmt).to(equal(TimeZone(abbreviation: "GMT")!))
            }
        }
    }
}
