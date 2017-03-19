//
//  Duration+MathSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DurationMathSpec: QuickSpec {
    override func spec() {
        describe(".+") {
            it("returns a new duration with the sum of both duration's components") {
                let oneYear = 1.year
                let twoYear = 2.years
                expect(oneYear + twoYear).to(equal(3.years))
                expect(oneYear + twoYear + twoYear).to(equal(5.years))
            }
        }
        
        describe(".-") {
            it("returns a new duration by subtract the first duration's components with the second") {
                let oneYear = 1.year
                let twoYear = 2.years
                expect(oneYear - twoYear).to(equal((-1).years))
                expect(oneYear - twoYear + twoYear).to(equal(1.years))
            }
        }
    }
}
