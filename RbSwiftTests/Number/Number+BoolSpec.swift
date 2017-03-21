//
//  NumberPatchSpec.swift
//  SwiftPatch
//
//  Created by draveness on 15/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class NumberBoolSpec: QuickSpec {
    
    override func spec() {
        describe(".bool") {
            expect(2.isZero).to(beFalse())
            expect((-2).isZero).to(beFalse())
            expect(0.isZero).to(beTrue())
            
            expect(2.isPositive).to(beTrue())
            expect((-2).isPositive).to(beFalse())
            expect(0.isPositive).to(beFalse())
            
            expect(2.isNegative).to(beFalse())
            expect((-2).isNegative).to(beTrue())
            expect(0.isNegative).to(beFalse())
            
            expect(0.isEven).to(beTrue())
            expect(2.isEven).to(beTrue())
            expect(1.isEven).to(beFalse())
            expect((-1).isEven).to(beFalse())
            expect((-2).isEven).to(beTrue())
            
            expect(0.isOdd).to(beFalse())
            expect(1.isOdd).to(beTrue())
            expect(2.isOdd).to(beFalse())
            expect((-2).isOdd).to(beFalse())
            expect((-1).isOdd).to(beTrue())
        }
    }
    
}
