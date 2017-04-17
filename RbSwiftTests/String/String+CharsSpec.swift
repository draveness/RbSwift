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

class StringCharsSpec: BaseSpec {
    
    override func spec() {
        describe(".chars") { 
            it("returns all characters in String form") {
                expect("abcde".chars).to(equal(["a", "b", "c", "d", "e"]))
            }
        }
        
        describe(".lines") {
            it("all lines in string form separated by newline `\n`") {
                expect("a\nb\nc\nd\ne".lines).to(equal(["a", "b", "c", "d", "e"]))
                expect("a\tb\tc\td\te".lines("\t")).to(equal(["a", "b", "c", "d", "e"]))
            }
        }
    }
}
