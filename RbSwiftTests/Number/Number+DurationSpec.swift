//
//  Number+DurationSpec.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberDurationSpec: QuickSpec {
    override func spec() {
        describe(".duration") {
            it("creates Duration instance correctly") {
                expect(1.year).to(equal(Duration(years: 1)))
                expect(2.years).to(equal(Duration(years: 2)))
                
                expect(1.month).to(equal(Duration(months: 1)))
                expect(3.months).to(equal(Duration(months: 3)))
                
                expect(1.day).to(equal(Duration(days: 1)))
                expect(30.days).to(equal(Duration(days: 30)))
                
                expect(1.hour).to(equal(Duration(hours: 1)))
                expect(50.hours).to(equal(Duration(hours: 50)))
                
                expect(1.minute).to(equal(Duration(minutes: 1)))
                expect(500.minutes).to(equal(Duration(minutes: 500)))
                
                expect(1.second).to(equal(Duration(seconds: 1)))
                expect(50000.seconds).to(equal(Duration(seconds: 50000)))
            }
        }
    }
}
