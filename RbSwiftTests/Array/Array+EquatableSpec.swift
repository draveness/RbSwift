//
//  Array+EquatableSpec.swift
//  RbSwift
//
//  Created by draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayEquatableSpec: QuickSpec {
    override func spec() {
        describe(".uniq") {
            it("returns an new array with unique element") {
                expect([1,2,3,1].uniq).to(equal([1,2,3]))
                expect([1,2,3,4].uniq).to(equal([1,2,3,4]))
            }
        }
    }
}

