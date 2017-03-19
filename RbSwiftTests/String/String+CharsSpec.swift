//
//  String+CharsSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringCharsSpec: QuickSpec {
    
    override func spec() {
        describe(".chars") { 
            it("returns all characters in String form") {
                expect("abcde".chars).to(equal(["a", "b", "c", "d", "e"]))
            }
        }
    }
}
