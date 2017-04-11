//
//  PathSpec.swift
//  RbSwift
//
//  Created by Draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class PathnameSpec: QuickSpec {
    override func spec() {
        describe(".+") {
            it("concat two path successfully.") {
                expect(Pathname("home") + Pathname("work")).to(equal(Pathname("home/work")))
                expect(Pathname("where/is/home") + Pathname("/work/dont/know")).to(equal(Pathname("/work/dont/know")))
                expect(Pathname("where/is/home") + Pathname("work/dont/know")).to(equal(Pathname("where/is/home/work/dont/know")))
            }
        }
    }
}
