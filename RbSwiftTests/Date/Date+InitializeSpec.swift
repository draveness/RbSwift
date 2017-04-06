//
//  InitializeSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateInitializeSpec: QuickSpec {
    override func spec() {
        beforeEach {
            GlobalTimeZone = TimeZone(identifier: "Asia/Shanghai")!
        }
        
//        afterEach {
//            GlobalTimeZone = TimeZone.current
//        }
        
        describe(".init(str:)") {
            it("parses str into date correctly") {
                let date = Date(str: "Sun Mar 19 01:04:21 2017")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(1))
                expect(date.minute).to(equal(4))
                expect(date.second).to(equal(21))
            }
            
            it("parses custom date format string correctly") {
                let date = Date(str: "2017-03-19 00:35:36 +0800")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(0))
                expect(date.minute).to(equal(35))
                expect(date.second).to(equal(36))
            }
        }
        
        describe(".init(year:month:day:hour:minute:second:)") {
            it("returns date correctly") {
                let date = Date(2017, 1, 2, 3, 4, 5)!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(1))
                expect(date.day).to(equal(2))
                expect(date.hour).to(equal(3))
                expect(date.minute).to(equal(4))
                expect(date.second).to(equal(5))
            }
        }
    }
}
