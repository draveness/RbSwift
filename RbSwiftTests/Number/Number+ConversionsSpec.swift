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

class NumberConversionsSpec: QuickSpec {
    
    override func spec() {
        describe(".chr") {
            it("returns a string containing the character represented by the int's value according to encoding.") {
                expect(98.chr).to(equal("b"))
            }
        }
    }
    
}
