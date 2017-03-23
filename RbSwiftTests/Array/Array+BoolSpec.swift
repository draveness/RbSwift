//
//  ArrayBoolSpec.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class ArrayBoolSpec: QuickSpec {
    
    override func spec() {
        describe(".isEql(other:)") {
            it("returns true if the elements of both arrays are exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 1]
                expect(arr1.isEql(arr2)).to(beTrue())
            }
            
            it("returns false if the elements of both arrays are not exactly the same") {
                let arr1 = [1, 2, 3]
                let arr2 = [3, 2, 2]
                expect(arr1.isEql(arr2)).to(beFalse())
                
                let arr3 = [1, 2, 3, 4]
                let arr4 = [1, 2, 3]
                expect(arr3.isEql(arr4)).to(beFalse())
            }
        }
    }
}
