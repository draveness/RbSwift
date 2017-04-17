//
//  Date+MathSpec.swift
//  RbSwift
//
//  Created by Draveness on 29/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateMathSpec: BaseSpec {
    override func spec() {
        describe(".+") {
            it("returns a new date") {
                let date = Date(str: "2017-10-10 10:10:10 +0000")!
                let newDate = date + 1.year
                expect(date.year).to(equal(2017))
                expect(newDate.year).to(equal(2018))
            }
        }
        
        describe(".-") {
            it("returns a new date") {
                let date = Date(str: "2017-10-10 10:10:10 +0000")!
                let newDate = date - 1.year
                expect(date.year).to(equal(2017))
                expect(newDate.year).to(equal(2016))
            }
        }
    }
}
