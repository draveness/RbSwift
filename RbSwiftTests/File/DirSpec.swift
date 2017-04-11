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
        let path: String = File.absolutePath("RbSwift/DirSpec")
        let originalPath = Dir.pwd

        beforeEach {
            try! Dir.mkdir(path, recursive: true)
            Dir.chdir(path)
        }
        
        afterEach {
            FileUtils.rm_rf(path)
            Dir.chdir(originalPath)
        }
        
        describe(".pwd") { 
            it("returns the current working directory") {
                expect(Dir.pwd).to(equal(path))
            }
        }

        describe(".home(path:)") {
            it("returns the home directory of the current user or the named user if given.") {
                expect(try! Dir.home("user")).to(equal(Dir.home))
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
            it("returns true if the named file is a directory, false otherwise.") {
                let path = "what/the/fuck/is/not/exists"
                try? Dir.rmdir(path)
                expect(Dir.isExist(path)).to(beFalse())
                try! Dir.mkdir((path), recursive: true)
                expect(Dir.isExist(path)).to(beTrue())
                try! Dir.rmdir(path)
                expect(Dir.isExist(path)).to(beFalse())
            }
        }
        
        describe(".rmdir(path:)") {
            it("throws error if the directory isn’t exits.") {
                let path = "rmdir/what/the/fuck/is/not/exists"
                expect { try Dir.rmdir(path) }.to(throwError())
            }

            it("throws error if the directory isn’t empty.") {
                let path = "rmdir/what/the/fuck/is/not/exists"

                // Creates directory and file
                try! Dir.mkdir(path, recursive: true)
                File.new(path + "/file.swift")
                
                expect {
                    try Dir.rmdir(path)
                }.to(throwError())
            }
        }
    }
}
