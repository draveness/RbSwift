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

class StringEnumerationSpec: BaseSpec {
    override func spec() {
        describe(".eachLine(separator:closure:)") {
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
        
        describe(".eachChar(closure:)") {
            it("separates the string by characters") {
                var results: [String] = []
                "Hello\n".eachChar {
                    results.append($0)
                }
                expect(results).to(equal(["H", "e", "l", "l", "o", "\n"]))
            }
        }
    }
}

