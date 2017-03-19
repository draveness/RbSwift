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

class StringTransformSpec: QuickSpec {
    override func spec() {
        describe(".concat") {
            it("concats two strings together") {
                expect("Hello".concat(" World")).to(equal("Hello World"))
            }
        }
        
        describe(".chomp") {
            it("returns a new string without whitespace in the end") {
                expect("1Hello\r1\n".chomp).to(equal("1Hello\r1"))
                expect("Hello\r\n\r\n".chomp).to(equal("Hello"))
                expect("Hello\n".chomp).to(equal("Hello"))
                expect("Hello  ".chomp).to(equal("Hello"))
                expect("Hello  \r".chomp).to(equal("Hello"))
                expect("  Hello  \r".chomp).to(equal("  Hello"))
                expect("".chomp).to(beEmpty())
            }
        }
        
        describe(".chomp(chars:)") {
            it("returns a new string without the passing chars in the end") {
                expect("Hello\r\n".chomp("o\r\n")).to(equal("Hell"))
                expect("Hello".chomp("o\r\n")).to(equal("Hello"))
            }
            
            it("returns a new string without newline") {
                expect("Hello\r\n\r\n".chomp("")).to(equal("Hello"))
                expect("Hello\r\n\r\r\n".chomp("")).to(equal("Hello\r\n\r"))
            }
        }
        
        describe(".chop") {
            it("returns a new string without the last character") {
                expect("Hello\r\n\r\n".chop).to(equal("Hello\r\n"))
                expect("Hello\r\n".chop).to(equal("Hello"))
                expect("Hello\n\r".chop).to(equal("Hello\n"))
                expect("Hello\n".chop).to(equal("Hello"))
                expect("x".chop).to(beEmpty())
                expect("".chop.chop).to(beEmpty())
            }
        }
        
        describe(".clear") {
            it("makes the string empty") {
                var s = "xyz"
                expect(s.clear()).to(beEmpty())
                expect(s).to(beEmpty())
            }
        }
        
        describe(".count(str:)") {
            
        }
        
        describe(".delete(str:)") {
            
        }
        
        describe(".reverse") {
            it("returns a new string with reverse order") {
                expect("Hello".reverse).to(equal("olleH"))
            }
        }
        
        describe(".split") {
            it("splits string into array") {
                expect(" now's  the time".split).to(equal(["now's", "the", "time"]))
                expect("hello".split("")).to(equal(["h", "e", "l", "l", "o"]))
                expect(" now's  the time".split(" ")).to(equal(["now's", "the", "time"]))
                expect("mellow yellow".split("ello")).to(equal(["m", "w y", "w"]))
                expect("1,2,,3,4,,".split(",")).to(equal(["1", "2", "", "3", "4"]))
            }
        }
        
        describe(".ljust") {
            context("when integer is greater than the length of str") {
                it("returns a new String of length integer with str left justified and padded with padstr") {
                    expect("hello".ljust(20)).to(equal("hello" + 15 * " "))
                    expect("hello".ljust(20, "1234")).to(equal("hello123412341234123"))
                }
            }
            
            context("otherwise") {
                it("returns the string") {
                    expect("hello".ljust(4)).to(equal("hello"))
                }
            }
        }
        
        describe(".rjust") {
            context("when integer is greater than the length of str") {
                it("returns a new String of length integer with str right justified and padded with padstr") {
                    expect("hello".rjust(20)).to(equal(15 * " " + "hello"))
                    expect("hello".rjust(20, "1234")).to(equal("123412341234123hello"))
                }
            }
            
            context("otherwise") {
                it("returns the string") {
                    expect("hello".rjust(4)).to(equal("hello"))
                }
            }
        }
        
        describe(".strip") {
            it("removes both sides whitespace from str") {
                expect("\t \nhello  ".strip).to(equal("hello"))
                expect("\t hello   ".strip).to(equal("hello"))
                expect("hello   ".strip).to(equal("hello"))
            }
        }
        
        describe(".lstrip") {
            it("removes leading whitespace from str") {
                expect("\t \nhello".lstrip).to(equal("hello"))
                expect("\t hello   ".lstrip).to(equal("hello   "))
            }
        }
        
        describe(".rstrip") {
            it("removes trailing whitespace from str") {
                expect("\t \nhello  ".rstrip).to(equal("\t \nhello"))
                expect("\t hello   ".rstrip).to(equal("\t hello"))
            }
        }
        
        describe(".prepend(other:)") {
            it("prepends the given string to str") {
                var str = "yz"
                expect(str.prepend("x")).to(match("xyz"))
                expect(str).to(match("xyz"))
            }
        }
        
        describe(".replace(other:)") {
            it("replaces the contents and taintedness of str with the corresponding values in other str") {
                var str = "yz"
                expect(str.replace("x")).to(match("x"))
                expect(str).to(match("x"))
            }
        }
        
        describe(".partition") {
            it("searches sep or pattern (regexp) in the string and returns the part before it, the match, and the part after it") {
                expect("hello".partition("l")).to(equal(["he", "l", "lo"]))
                expect("hello".partition("le")).to(equal(["hello", "", ""]))
            }
        }
        
        describe(".rpartition") {
            it("searches sep or pattern (regexp) in the string from the end of it and returns the part before it, the match, and the part after it") {
                expect("hello".rpartition("l")).to(equal(["hel", "l", "o"]))
                expect("hello".rpartition("le")).to(equal(["", "", "hello"]))
            }
        }
    }
}

