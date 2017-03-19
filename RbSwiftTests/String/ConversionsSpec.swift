//
//  Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringConversionsSpec: QuickSpec {
    override func spec() {
        describe(".to_i") {
            it("returns an integer under different circumstances") {
                expect("12".to_i).to(equal(12))
                expect("0a".to_i).to(equal(0))
                expect("0a".to_i(16)).to(equal(10))
                expect("0a".to_i(37)).to(equal(0))
                expect("0a".to_i(1)).to(equal(0))
                expect("hello".to_i).to(equal(0))
                expect("1100101".to_i(2)).to(equal(101))
                expect("1100101".to_i(8)).to(equal(294977))
                expect("1100101".to_i(10)).to(equal(1100101))
                expect("1100101".to_i(16)).to(equal(17826049))
            }
        }
    }
}

