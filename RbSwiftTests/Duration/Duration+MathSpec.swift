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

class DurationMathSpec: BaseSpec {
    override func spec() {
        describe(".+") {
            it("returns a new duration with the sum of both duration's components") {
                expect(1.year + 2.years).to(equal(3.years))
                expect(1.year + 4.years).to(equal(5.years))
                expect(1.minute + 500.seconds).to(equal(560.seconds))
                expect(1.hour + 500.seconds).to(equal(4100.seconds))
                expect(1.week + 500.seconds).to(equal(605_300.seconds))
                expect(1.week + 500.seconds).to(equal(7.days + 8.minutes + 20.seconds))
            }
        }
        
        describe(".-") {
            it("returns a new duration by subtract the first duration's components with the second") {
                expect(1.year - 2.years).to(equal((-1).years))
                expect(1.year - 2.years + 2.years).to(equal(1.years))
            }
        }
    }
}
