//
//  LengthSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class SequenceLengthSpec: QuickSpec {
    override func spec() {
        describe(".length") {
            it("returns the length of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.length).to(equal(arr.count))
            }
        }
        
        describe(".size") {
            it("returns the length of array") {
                let arr = [1, 2, 3, 4]
                expect(arr.size).to(equal(arr.count))
            }
        }
        
        describe(".count") {
            it("returns the length of array according to specific condition") {
                let arr = [1, 2, 3, 4]
                expect(arr.count { $0.isEven }).to(equal(2))
            }
        }
    }
}

