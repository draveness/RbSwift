//
//  Date+BoolSpec.swift
//  RbSwift
//
//  Created by draveness on 29/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateBoolSpec: BaseSpec {
    override func spec() {
        describe(".isWeekday") {
            it("returns a bool value") {
                expect(Date(str: "2017-03-27 12:00:00 +0000")!.isMonday).to(beTrue())
                expect(Date(str: "2017-03-28 12:00:00 +0000")!.isTuesday).to(beTrue())
                expect(Date(str: "2017-03-29 12:00:00 +0000")!.isWednesday).to(beTrue())
                expect(Date(str: "2017-03-30 12:00:00 +0000")!.isThursday).to(beTrue())
                expect(Date(str: "2017-03-31 12:00:00 +0000")!.isFriday).to(beTrue())
                expect(Date(str: "2017-04-01 12:00:00 +0000")!.isSaturday).to(beTrue())
                expect(Date(str: "2017-04-02 12:00:00 +0000")!.isSunday).to(beTrue())
            }
        }
    }
}
