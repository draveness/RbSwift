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

class StringLengthSpec: BaseSpec {
    override func spec() {
        describe(".length") {
            it("returns the length of string") {
                let string = "A very very long string"
                expect(string.length).to(equal(string.characters.count))
            }
        }
        
        describe(".size") {
            it("returns the length of string") {
                let string = "A very very long string"
                expect(string.size).to(equal(string.characters.count))
            }
        }
        
        describe(".count") {
            it("returns the length of string") {
                let string = "A very very long string"
                expect(string.count).to(equal(string.characters.count))
            }
        }
    }
}

