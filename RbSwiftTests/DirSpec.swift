//
//  DirSpec.swift
//  RbSwift
//
//  Created by draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class DirSpec: QuickSpec {
    override func spec() {
        describe(".home(path:)") {
            it("returns the home directory of the current user or the named user if given.") {
                expect(Dir.home("user")).to(equal("/user"))
            }
        }
        
        describe(".chdir(path:)") {
            it("changes the curernt working directory of the process to the ginven string.") {
                try! Dir.mkdir("draveness/spool/mail", recursive: true)
                Dir.chdir("draveness/spool/mail")
                expect(Dir.pwd.hasSuffix("draveness/spool/mail")).to(beTrue())
                
                let value = Dir.chdir("draveness") {
                    return "Inside another directory"
                }
                expect(value).to(equal("Inside another directory"))
            }
        }
        
        describe(".exist(path:)") {
            it("Returns true if the named file is a directory, false otherwise.") {
                expect(Dir.isExist("what/the/fuck/is/not/exists")).to(beFalse())
                try! Dir.mkdir(("what/the/fuck/is/not/exists"), recursive: true)
                expect(Dir.isExist("what/the/fuck/is/not/exists")).to(beTrue())
            }
        }
    }
}
