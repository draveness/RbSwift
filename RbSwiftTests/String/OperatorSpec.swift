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

class StringOperatorSpec: QuickSpec {
    override func spec() {
        describe(".*") {
            it("returns the multiple strings concatenation") {
                let string = "String"
                expect(string * 3).to(equal(string + string + string))
            }
        }
        
        describe(".<<") {
            it("concats two strings together") {
                expect("Hello" << " World").to(equal("Hello World"))
            }
        }
        
    }
}

