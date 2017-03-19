//
//  Duration+RelativeSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//


import Quick
import Nimble
import RbSwift

class DurationRelativeSpec: QuickSpec {
    override func spec() {
        describe(".ago/before") {
            it("returns a date minus current duration") {
                let aYearAgo = 1.year.ago
                let now = Date.now
                expect(aYearAgo.year).to(equal(now.year - 1))
                expect(aYearAgo.month).to(equal(now.month))
                expect(aYearAgo.day).to(equal(now.day))
                expect(aYearAgo.hour).to(equal(now.hour))
                expect(aYearAgo.minute).to(equal(now.minute))
                expect(aYearAgo.second).to(equal(now.second))
            }
            
            it("returns a date with passing date minus duration") {
                let date = "2018-01-01 12:00:30 +0800".to_datetime!
                let beforeDate = 1.year.ago(date)
                expect(beforeDate.year).to(equal(2017))
                expect(beforeDate.month).to(equal(1))
                expect(beforeDate.day).to(equal(1))
                expect(beforeDate.hour).to(equal(12))
                expect(beforeDate.minute).to(equal(0))
                expect(beforeDate.second).to(equal(30))
            }
            
            it("returns the same date with ago & before") {
                let aYearAgo = 1.year.ago
                let aYearBefore = 1.year.before
                expect(aYearAgo.year).to(equal(aYearBefore.year))
                expect(aYearAgo.month).to(equal(aYearBefore.month))
                expect(aYearAgo.day).to(equal(aYearBefore.day))
                expect(aYearAgo.hour).to(equal(aYearBefore.hour))
                expect(aYearAgo.minute).to(equal(aYearBefore.minute))
                expect(aYearAgo.second).to(equal(aYearBefore.second))
            }
        }
        
        describe(".since/later") {
            it("returns a date plua current duration") {
                let aYearSince = 1.year.since
                let now = Date.now
                expect(aYearSince.year).to(equal(now.year + 1))
                expect(aYearSince.month).to(equal(now.month))
                expect(aYearSince.day).to(equal(now.day))
                expect(aYearSince.hour).to(equal(now.hour))
                expect(aYearSince.minute).to(equal(now.minute))
                expect(aYearSince.second).to(equal(now.second))
            }

            it("returns a date with passing date add duration") {
                let date = "2018-01-01 12:00:30 +0800".to_datetime!
                let afterDate = 1.year.since(date)
                expect(afterDate.year).to(equal(2019))
                expect(afterDate.month).to(equal(1))
                expect(afterDate.day).to(equal(1))
                expect(afterDate.hour).to(equal(12))
                expect(afterDate.minute).to(equal(0))
                expect(afterDate.second).to(equal(30))
            }
            
            it("returns the same date with since & later") {
                let aYearSince = 1.year.since
                let aYearLater = 1.year.later
                expect(aYearSince.year).to(equal(aYearLater.year))
                expect(aYearSince.month).to(equal(aYearLater.month))
                expect(aYearSince.day).to(equal(aYearLater.day))
                expect(aYearSince.hour).to(equal(aYearLater.hour))
                expect(aYearSince.minute).to(equal(aYearLater.minute))
                expect(aYearSince.second).to(equal(aYearLater.second))
            }
        }
    }
}
