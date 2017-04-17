//
//  Array+OrdinalSpec.swift
//  RbSwift
//
//  Created by draveness on 15/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayOrdinalSpec: BaseSpec {
    override func spec() {
        describe(".ordinals") {
            it("returns element with specific index.") {
                let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                expect(arr.first).to(equal(1))
                expect(arr.second).to(equal(2))
                expect(arr.third).to(equal(3))
                expect(arr.fourth).to(equal(4))
                expect(arr.fifth).to(equal(5))
                expect(arr.sixth).to(equal(6))
                expect(arr.seventh).to(equal(7))
                expect(arr.eighth).to(equal(8))
                expect(arr.ninth).to(equal(9))
                expect(arr.tenth).to(equal(10))
                expect(arr.secondToLast).to(equal(9))
                expect(arr.thirdToLast).to(equal(8))
            }
        }
    }
}
