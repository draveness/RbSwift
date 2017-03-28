//
//  RegexSpec.swift
//  RbSwift
//
//  Created by draveness on 29/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class RegexSpec: QuickSpec {
    
    override func spec() {
        describe(".match(str:pos:closure:)") {
            it("returns match data if there is a match") {
                let data = "[a-e]+".regex.match("hello")!
                expect(data.match).to(equal("e"))
                expect(data.to_a).to(equal(["e"]))
                
                "[a-e]+".regex.match("hello") { data in
                    expect(data.match).to(equal("e"))
                }
                
                "[a-e]+".regex.match("hello", 2) { data in
                    expect(true).to(beFalse())
                }
                
                "[a-e]+".regex.match("hello", 1) { data in
                    expect(data.range).to(equal(NSMakeRange(1, 1)))
                }
            }
        }
        
        describe(".scan(str:") {
            it("returns an array of match data if there is a match") {
                let datas = "[aeiou]+".regex.scan("hello")
                expect(datas.count).to(equal(2))
                expect(datas[0].match).to(equal("e"))
                expect(datas[1].match).to(equal("o"))
            }
        }
        
        describe(".replace(str:template:)") {
            it("") {
                let str = "hello"
                expect("l".regex.replace(str, "abc")).to(equal("heabcabco"))
                expect("le".regex.replace(str, "lll")).to(equal("hello"))
                expect(".".literal.replace(str, "lll")).to(equal("hello"))
                expect(".".regex.replace(str, "lll")).to(equal("lll" * 5))
                expect("^he".regex.replace(str, "lll")).to(equal("lllllo"))
                expect("\\b(?<!['’`])[a-z]".regex.replace("my name is draven", "a")).to(equal("ay aame as araven"))
            }
        }
    }
}
