//
//  DateFormatSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateFormatSpec: QuickSpec {
    override func spec() {
        describe("#parse") {
            beforeEach {
                TimeZone.global = TimeZone(identifier: "Asia/Shanghai")!
            }
            
            it("parses custom date format string correctly") {
                let date = DateFormat.parse(str: "2017-03-19 00:35:36 +0800")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(0))
                expect(date.minute).to(equal(35))
                expect(date.second).to(equal(36))
//                expect(date.timeZone).to(equal(TimeZone(abbreviation: "CST")!))
            }
            
            it("parses iso8601 date format string correctly") {
                let date = DateFormat.parse(str: "2017-03-19T01:00:59+08:00")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(1))
                expect(date.minute).to(equal(0))
                expect(date.second).to(equal(59))
            }
            
            it("parses rfc2822 date format string correctly") {
                let date = DateFormat.parse(str: "Sun, 19 Mar 2017 01:02:04 +0800")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(1))
                expect(date.minute).to(equal(2))
                expect(date.second).to(equal(4))
            }
            
            it("parses ctime date format string correctly") {
                let date = DateFormat.parse(str: "Sun Mar 19 01:04:21 2017")!
                expect(date.year).to(equal(2017))
                expect(date.month).to(equal(3))
                expect(date.day).to(equal(19))
                expect(date.hour).to(equal(1))
                expect(date.minute).to(equal(4))
                expect(date.second).to(equal(21))
            }
        }
    }
}
