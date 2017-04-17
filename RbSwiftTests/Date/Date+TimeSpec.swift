//
//  Date+TimeSpec.swift
//  RbSwift
//
//  Created by draveness on 29/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateTimeSpec: BaseSpec {
    override func spec() {
        describe(".change(year:month:day:hour:minute:second:)") {
            it("changes the origianl date components") {
                var date = Date(str: "2017-10-10 10:10:10 +0000")!
                expect(date.year).to(equal(2017))
                date.changed(year: 2000)
                expect(date.year).to(equal(2000))
                
                expect(date.month).to(equal(10))
                let newDate = date.change(month: 12)
                expect(newDate.month).to(equal(12))
            }
        }
    }
}
