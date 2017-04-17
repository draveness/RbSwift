//
//  DurationSpec.swift
//  RbSwift
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DurationSpec: BaseSpec {
    override func spec() {
        let oneYear = Duration(years: 1)
        let oneMonth = Duration(months: 1)
        let threeDays = Duration(days: 3)
        let oneYearSeconds = Duration(seconds: 31_556_952)

        describe(".init") {
            it("creates successfully") {
                expect(oneYear.years).to(equal(1))
                expect(oneMonth.months).to(equal(1))
                expect(threeDays.days).to(equal(3))
            }
        }
        
        describe(".toSeconds") {
            it("returns correct seconds") {
                expect(oneYear.toSeconds).to(equal(31_556_952))
                expect(oneMonth.toSeconds).to(equal(2_629_746))
                expect(threeDays.toSeconds).to(equal(86_400 * 3))
            }
        }
        
        describe(".to_s") { 
            it("returns correct seconds with string form") {
                expect(oneYear.to_s).to(equal("31556952"))
                expect(oneMonth.to_s).to(equal("2629746"))
                expect(threeDays.to_s).to(equal("259200"))
            }
        }
        
        describe(".==") { 
            expect(oneYear).to(beGreaterThan(oneMonth))
            expect(oneMonth).to(beGreaterThan(threeDays))
            expect(oneYearSeconds).to(equal(oneYear))
        }
    }
}
