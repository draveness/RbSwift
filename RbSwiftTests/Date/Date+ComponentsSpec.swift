//
//  DatePatchSpec.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DateComponentsSpec: QuickSpec {
    override func spec() {
        
        describe(".dateComponents") {
            beforeEach {
                TimeZone.global = TimeZone.utc
            }
            
            afterEach {
                TimeZone.global = TimeZone.current
            }

            it("returns date's components correctly") {
                // 00:00:00 UTC on 1 January 1970
                let date = Date(timeIntervalSince1970: 0).utc
                expect(date.year).to(equal(1970))
                expect(date.month).to(equal(1))
                expect(date.day).to(equal(1))
                expect(date.hour).to(equal(0))
                expect(date.minute).to(equal(0))
                expect(date.second).to(equal(0))
            }
        }
    }
}
