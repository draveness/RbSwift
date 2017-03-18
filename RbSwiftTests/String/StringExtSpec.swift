//
//  StringExtSpec.swift
//  SwiftPatch
//
//  Created by draveness on 17/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringExtSpec: QuickSpec {
    
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
        
        describe(".isBlank") { 
            it("is blank if it's empty or contains whitespaces only") {
                expect("  ".isBlank).to(beTrue())
                expect("\t\n\r\n".isBlank).to(beTrue())
                expect("\t\nblah".isBlank).to(beFalse())
            }
        }
        
        describe(".isExclude(substring:)") {
            it("returns true if the string does not include the other string.") {
                expect("  ".isExlude("he")).to(beTrue())
                expect("he".isExlude("he")).to(beFalse())
                expect("ohe".isExlude("he")).to(beFalse())
            }
        }
        
        describe(".camelize(upper)") { 
            it("returns the camelize string") {
                expect("os_version".camelize).to(equal("OsVersion"))
                expect("os_version_ten".camelize).to(equal("OsVersionTen"))
                expect("os_version_TEn".camelize).to(equal("OsVersionTen"))
                expect("os_version".camelize(.lower)).to(equal("osVersion"))
            }
        }
        
        describe(".underscore") { 
            it("returns the snake case string") {
                expect("OsVersionTen".underscore).to(equal("os_version_ten"))
                expect("osVersionTen".underscore).to(equal("os_version_ten"))
                expect("osVerSionTen".underscore).to(equal("os_ver_sion_ten"))
            }
        }
        
        describe(".singularize") {
            it("returns the singularize form of string") {
                expect("people".singularize).to(equal("person"))
                expect("monkeys".singularize).to(equal("monkey"))
                expect("users".singularize).to(equal("user"))
                expect("men".singularize).to(equal("man"))
            }
        }
        
        describe(".pluralize") {
            it("returns the pluralize form of string") {
                expect("person".pluralize).to(equal("people"))
                expect("monkey".pluralize).to(equal("monkeys"))
                expect("user".pluralize).to(equal("users"))
                expect("man".pluralize).to(equal("men"))
            }
        }
        
        describe(".tableize") { 
            it("creates the name of a table like Rails does for models to table names") {
                expect("RawScaledScorer".tableize).to(equal("raw_scaled_scorers"))
                expect("egg_and_ham".tableize).to(equal("egg_and_hams"))
                expect("fancyCategory".tableize).to(equal("fancy_categories"))
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

        describe(".foreignKey(separate:)") {
            it("returns a foreign key with current string") {
                expect("people".foreignKey).to(equal("people_id"))
                expect("people".foreignKey).to(equal("people_id"))
                expect("MessageQueue".foreignKey).to(equal("message_queue_id"))
                expect("MessageQueue".foreignKey(false)).to(equal("message_queueid"))
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
                expect(str).to(equal("foo bar test"))
            }
        }
        
        describe(".squish") { 
            it("changes consecutive into one space each") {
                expect("    Multi-line\n string ".squish).to(equal("Multi-line string"))
                expect(" foo   bar    \n   \t   boo    ".squish).to(equal("foo bar boo"))
            }
        }
        
        describe(".indent(amount:str:)") {
            it("indents the lines in the reveiver") {
                expect("  foo".indent(2)).to(equal("\t\tfoo"))
                expect("  foo".indent(2, "  ")).to(equal("    foo"))
                expect("  foo\n\tbar".indent(2, "  ")).to(equal("    foo\n    bar"))
            }
        }
    }
}

