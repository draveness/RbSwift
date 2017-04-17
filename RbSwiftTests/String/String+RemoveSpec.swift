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

class StringRemoveSpec: BaseSpec {
    override func spec() {
        describe(".truncate(at:omission:)") {
            it("truncates a given text after a given length if text is longer than length") {
                let str = "Once upon a time in a world far far away"
                expect(str.truncate(27)).to(equal("Once upon a time in a wo..."))
                let anotherStr = "And they found that many people were sleeping better."
                expect(anotherStr.truncate(25, omission: "... (continued)")).to(equal("And they f... (continued)"))
                let shortStr = "test"
                expect(shortStr.truncate(3, omission: "... (continued)")).to(equal("test"))
            }
        }
        
        describe(".remove(str:)") {
            it("returns a new string with all occurrences of the strs removed") {
                let str = "foo bar test"
                expect(str.remove(" test")).to(equal("foo bar"))
                expect(str.remove(" test", "bar")).to(equal("foo "))
                expect(str.remove(".")).to(equal(""))
                expect(str).to(equal("foo bar test"))
                expect("returns a new string with all occurrences of the strs removed".remove("s"))
                    .to(equal("return a new tring with all occurrence of the tr removed"))
            }
        }
        
        describe(".squish") {
            it("changes consecutive into one space each") {
                expect("    Multi-line\n string ".squish).to(equal("Multi-line string"))
                expect(" foo   bar    \n   \t   boo    ".squish).to(equal("foo bar boo"))
            }
        }
        
        describe(".squeeze") {
            it("Returns a new string where runs of the same character that occur in this str replaced by single char") {
                expect("yellow moon".squeeze).to(equal("yelow mon"))
                expect("  now   is  the".squeeze(" ")).to(equal(" now is the"))
                expect("putters shoot balls".squeeze("to")).to(equal("puters shot balls"))
            }
        }
    }
}

