//
//  Access.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringAccessSpec: BaseSpec {
    
    override func spec() {
        describe(".at(pos:)") {
            it("returns a substring of one character at that position") {
                expect("Hello".at(1)).to(equal("e"))
                expect("Hello".at(2)).to(equal("l"))
                expect("Hello".at(4)).to(equal("o"))
                expect("Hello".at(5)).to(beNil())
                expect("Hello".at(10)).to(beNil())
            }
            
            it("returns a substring containing characters at offsets given by the range") {
                expect("Hello".at(1...2)).to(equal("el"))
                expect("Hello".at(1...4)).to(equal("ello"))
                expect("Hello".at(1...5)).to(equal("ello"))
                expect("Hello".at(4...9)).to(equal("o"))
                expect("Hello".at(5...9)).to(equal(""))
                
                expect("Hello".at(1..<2)).to(equal("e"))
                expect("Hello".at(1..<4)).to(equal("ell"))
                expect("Hello".at(1..<5)).to(equal("ello"))
                expect("Hello".at(1..<6)).to(equal("ello"))
                expect("Hello".at(5..<9)).to(equal(""))
                
                expect("Hello".at(6...9)).to(beNil())
                expect("Hello".at(7..<9)).to(beNil())
            }
        }
        
        describe(".first(limit:)") {
            it("returns first n char of current string") {
                let str = "people"
                expect(str.first).to(equal("p"))
                expect(str.first(0)).to(equal(""))
                expect(str.first(1)).to(equal("p"))
                expect(str.first(2)).to(equal("pe"))
                expect(str.first(4)).to(equal("peop"))
                expect(str.first(50)).to(equal("people"))
            }
        }
        
        describe(".last(limit:)") {
            it("returns last n char of current string") {
                let str = "people"
                expect(str.last).to(equal("e"))
                expect(str.last(0)).to(equal(""))
                expect(str.last(1)).to(equal("e"))
                expect(str.last(2)).to(equal("le"))
                expect(str.last(4)).to(equal("ople"))
                expect(str.last(50)).to(equal("people"))
            }
        }

        describe(".from(num:)") {
            it("returns a substring from the given position to the end of the string") {
                let str = "hello"
                expect(str.from(0)).to(equal("hello"))
                expect(str.from(3)).to(equal("lo"))
                expect(str.from(5)).to(equal(""))
                expect(str.from(-5)).to(equal(""))
                expect(str.from(-6)).to(equal(""))
                expect(str.from(-2)).to(equal("lo"))
                expect(str.from(-1)).to(equal("o"))
                expect(str.from(-2)).to(equal("lo"))
            }
        }
        
        describe(".to(num:)") {
            it("returns a substring from the beginning of the string to the given position") {
                let str = "hello"
                expect(str.to(0)).to(equal("h"))
                expect(str.to(3)).to(equal("hell"))
                expect(str.to(4)).to(equal("hello"))
                expect(str.to(5)).to(equal("hello"))
                expect(str.to(-2)).to(equal("hell"))
                expect(str.to(-6)).to(equal(""))
                expect(str.to(-7)).to(equal(""))
            }
        }
        
        describe(".range(from:to:)") { 
            it("returns a substring within the range of the given parameter") {
                let str = "hello"
                expect(str.range(0, 0)).to(equal("h"))
                expect(str.range(0, 1)).to(equal("he"))
                expect(str.range(0, 10)).to(equal("hello"))
                expect(str.range(3, 10)).to(equal("lo"))
            }
        }
        
        describe(".substring(from:)") {
            it("returns a new string substring from index") {
                expect("Hello".substring(from: 1)).to(equal("ello"))
                expect("H\n11".substring(from: 2)).to(equal("11"))
            }
        }
        
        describe(".substring(to:)") {
            it("returns a new string substring to index") {
                expect("Hello".substring(to: 1)).to(equal("H"))
                expect("H\n11".substring(to: 2)).to(equal("H\n"))
            }
        }
        
        describe(".chr") {
            it("returns the first char of a string") {
                expect("xyz".chr).to(equal("x"))
                expect("".chr).to(beEmpty())
                expect("xyz".chr).to(equal("xyz".first))
            }
        }
        
        describe(".index") {
            it("returns the index of the first occurrence of the given substring in str") {
                expect("hello".index("e")).to(equal(1))
                expect("hello".index("l")).to(equal(2))
                expect("hello".index("a")).to(beNil())
            }
        }
        
        describe(".rindex") {
            it("returns the index of the last occurrence of the given substring in str") {
                expect("hello".rindex("e")).to(equal(1))
                expect("hello".rindex("l")).to(equal(3))
                expect("hello".rindex("x")).to(beNil())
            }
        }
    }
}

