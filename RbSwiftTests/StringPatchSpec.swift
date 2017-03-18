//
//  StringPatchSpec.swift
//  SwiftPatch
//
//  Created by draveness on 15/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringPatchSpec: QuickSpec {

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
        
        describe(".*") { 
            it("returns the multiple strings concatenation") {
                let string = "String"
                expect(string * 3).to(equal(string + string + string))
            }
        }
        
        describe(".concat") { 
            it("concats two strings together") {
                expect("Hello".concat(" World")).to(equal("Hello World"))
            }
        }
        
        describe(".<<") { 
            it("concats two strings together") {
                expect("Hello" << " World").to(equal("Hello World"))
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
        
        describe(".substring(to:)") {
            it("returns a new string substring to index") {
                expect("Hello".substring(to: 1)).to(equal("H"))
                expect("H\n11".substring(to: 2)).to(equal("H\n"))
            }
        }
        
        describe(".substring(from:)") {
            it("returns a new string substring from index") {
                expect("Hello".substring(from: 1)).to(equal("ello"))
                expect("H\n11".substring(from: 2)).to(equal("11"))
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
        
        describe(".chr") { 
            it("returns the first char of a string") { 
                expect("xyz".chr).to(equal("x"))
                expect("".chr).to(beEmpty())
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
        
        describe(".downcase") {
            it("returns a copy of str with all lowercase letters replaced with their uppercase counterparts") {
                expect("Hello".downcase).to(equal("hello"))
                expect("HellHEo".downcase).to(equal("hellheo"))
            }
        }
        
        describe(".downcased") {
            it("mutates current string with downcase") {
                var hello = "Hello"
                hello.downcased()
                expect(hello).to(equal("hello"))
            }
        }
        
        describe(".upcase") {
            it("returns a copy of str with all uppercase letters replaced with their lowercase counterparts") {
                expect("Hello".upcase).to(equal("HELLO"))
                expect("HellHEo".upcase).to(equal("HELLHEO"))
            }
        }
        
        describe(".upcased") {
            it("mutates current string with upcase") {
                var hello = "Hello"
                hello.upcased()
                expect(hello).to(equal("HELLO"))
            }
        }

        describe(".isUpcase") {
            it("") {
                expect("HELLO".isUpcase).to(beTrue())
                expect("HELLOo".isUpcase).to(beFalse())
            }
        }
        
        describe(".isDowncase") {
            it("") {
                expect("HELLO".isDowncase).to(beFalse())
                expect("HELLOo".isDowncase).to(beFalse())
                expect("hello".isDowncase).to(beTrue())
            }
        }
        
        describe(".swapcase") { 
            it("returns a copy of str with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase") {
                expect("HellHEo".swapcase).to(equal("hELLheO"))
            }
        }
        
        describe(".eachLine()") {
            it("separates the string by \\n characters") {
                var results: [String] = []
                "Hello\nWorld".eachLine {
                    results.append($0)
                }
                expect(results).to(equal(["Hello\n", "World"]))
            }

            it("separates the string by passing characters") {
                var results: [String] = []
                "Hello\nWorld".eachLine("l") {
                    results.append($0)
                }
                expect(results).to(equal(["Hel", "l", "o\nWorl", "d"]))
            }
        }
        
        describe(".eachChar()") { 
            it("separates the string by characters") {
                var results: [String] = []
                "Hello\n".eachChar {
                    results.append($0)
                }
                expect(results).to(equal(["H", "e", "l", "l", "o", "\n"]))
            }
        }
        
        describe(".isEmpty") { 
            it("returns true when length is zero") {
                expect("".isEmpty).to(beTrue())
            }

            it("returns false when length is not zero") {
                expect(" ".isEmpty).to(beFalse())
                expect("111 ".isEmpty).to(beFalse())
            }
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
        
        describe(".match(str:)") { 
            it("converts pattern to a NSRegularExpression, then invokes its match method on str") {
                let matchData = "hello".match("(.)ll(o)")!
                expect(matchData.match).to(equal("ello"))
                expect(matchData.datas[0]).to(equal("e"))
                expect(matchData.datas[1]).to(equal("o"))
            }
            
            it("retuns nil if matches nothing") {
                let matchData = "hello".match("aha")
                expect(matchData).to(beNil())
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
        
        describe(".to_i") { 
            it("returns an integer under different circumstances") {
                expect("12".to_i).to(equal(12))
                expect("0a".to_i).to(equal(0))
                expect("0a".to_i(16)).to(equal(10))
                expect("0a".to_i(37)).to(equal(0))
                expect("0a".to_i(1)).to(equal(0))
                expect("hello".to_i).to(equal(0))
                expect("1100101".to_i(2)).to(equal(101))
                expect("1100101".to_i(8)).to(equal(294977))
                expect("1100101".to_i(10)).to(equal(1100101))
                expect("1100101".to_i(16)).to(equal(17826049))
            }
        }
    }
}
