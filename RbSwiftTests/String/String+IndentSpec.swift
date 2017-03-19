//
//  IndentSpec.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class StringIndentSpec: QuickSpec {
    override func spec() {
        describe(".indent(amount:indentString:)") {
            it("indents the lines in the reveiver") {
                expect("  foo".indent(2)).to(equal("\t\tfoo"))
                expect("  foo".indent(2, "  ")).to(equal("    foo"))
                expect("  foo\n\tbar".indent(2, "  ")).to(equal("    foo\n    bar"))
            }
        }
        
        describe(".indented(amount:indentString:)") {
            it("mutates self with indent") {
                var str = "  foo\n\tbar"
                str.indented(2, "  ")
                expect(str).to(equal("    foo\n    bar"))
            }
        }
    }
}
