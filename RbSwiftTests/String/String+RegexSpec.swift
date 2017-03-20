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

class StringRegexSpec: QuickSpec {
    override func spec() {
        
        describe(".sub") {
            it("returns a copy of str with the first occurrence of pattern replaced by the second argument") {
                expect("hello".sub("l", "abc")).to(equal("heabclo"))
                expect("hello".sub("le", "lll")).to(equal("hello"))
                expect("hello".sub(".", "a")).to(equal("aello"))
            }
        }
        
        describe(".subed") {
            it("returns a copy of str with the first occurrence of pattern replaced by the second argument") {
                var hello = "hello"
                hello.subed("l", "abc")
                expect(hello).to(equal("heabclo"))
            }
        }
        
        describe(".gsub") {
            it("returns a copy of str with the first occurrence of pattern replaced by the second argument") {
                expect("hello".gsub("l", "abc")).to(equal("heabcabco"))
                expect("hello".gsub("le", "lll")).to(equal("hello"))
                expect("hello".gsub(".".literal, "lll")).to(equal("hello"))
                expect("hello".gsub(".", "lll")).to(equal("lll" * 5))
                expect("hello".gsub("^he", "lll")).to(equal("lllllo"))
                expect("my name is draven".gsub("\\b(?<!['’`])[a-z]") { _ in
                    return "a"
                }).to(equal("ay aame as araven"))
            }
        }
        
        describe(".gsubed") {
            it("mutates current string with gsub") {
                var hello = "hello"
                hello.gsubed("l", "abc")
                expect(hello).to(equal("heabcabco"))
            }
        }
        
        describe(".match(str:)") {
            it("converts pattern to a NSRegularExpression, then invokes its match method on str") {
                let matchData = "hello".match("(.)ll(o)")!
                expect(matchData.match).to(equal("ello"))
                expect(matchData.captures[0]).to(equal("e"))
                expect(matchData.captures[1]).to(equal("o"))
            }
            
            it("retuns nil if matches nothing") {
                let matchData = "hello".match("aha")
                expect(matchData).to(beNil())
            }
        }
        
        describe(".scan(str:)") {
            it("returns all the match results in an array") {
                let str = "abcxxabcxxsbc"
                let scanResults = str.scan("(.)bc")
                expect(scanResults[0].to_a).to(equal(["abc", "a"]))
                expect(scanResults[1].to_a).to(equal(["abc", "a"]))
                expect(scanResults[2].to_a).to(equal(["sbc", "s"]))
            }
        }
    }
}

