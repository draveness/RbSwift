//
//  Number+AbsoluteValueSpec.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberAbsoluteValueSpec: BaseSpec {
    override func spec() {
        describe(".abs") {
            it("returns the absolute value of self") {
                expect((-1).abs).to(equal(1))
                expect((-2).abs).to(equal(2))
                expect((2).abs).to(equal(2))
                expect((0).abs).to(equal(0))
            }
        }
        
        describe(".magnitude") {
            it("returns the absolute value of self") {
                expect((-1).magnitude).to(equal(1))
                expect((-2).magnitude).to(equal(2))
                expect((2).magnitude).to(equal(2))
                expect((0).magnitude).to(equal(0))
            }
        }
    }
    
}
