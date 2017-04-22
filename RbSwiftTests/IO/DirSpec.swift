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

class DirSpec: BaseSpec {
    override func spec() {
        let path: String = File.absolutePath("RbSwift/DirSpec")
        let originalPath = Dir.pwd

        beforeEach {
            FileUtils.mkdir_p(path)
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
                FileUtils.mkdir_p("draveness/spool/mail")
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
                FileUtils.mkdir_p((path))
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
                FileUtils.mkdir_p(path)
                FileUtils.touch(path + "/file.swift")
                
                expect {
                    try Dir.rmdir(path)
                }.to(throwError())
            }
        }
        
        describe(".isExist(path:)") {
            beforeEach {
                FileUtils.mkdir_p("a/folder/with/files")
                FileUtils.touch("a/folder/with/files/text.swift")
            }
            
            afterEach {
                FileUtils.rm_rf("a/folder/with/files")
            }

            it("returns true if the folder is exists.") {
                expect(Dir.isExist("a/folder/not/exists")).to(equal(false))
                expect(Dir.isExist("a/folder/with/files")).to(equal(true))
                expect(Dir.isExist("a/folder/with/files/text.swift")).to(equal(false))
            }
        }
        
        describe(".isEmpty(path:)") {
            beforeEach {
                FileUtils.mkdir_p("a/empty/folder")
                FileUtils.mkdir_p("a/folder/with/files")
                FileUtils.touch("a/folder/with/files/text.swift")
            }
            
            afterEach {
                FileUtils.rm_rf("a/empty/folder")
                FileUtils.rm_rf("a/folder/with/files")
            }
            
            it("returns true if the folder is empty or not exists.") {
                expect(Dir.isEmpty("a/empty/folder")).to(equal(true))
                expect(Dir.isEmpty("a/folder/not/exists")).to(equal(true))
            }
            
            it("returns false if the folder is not empty") {
                expect(Dir.isEmpty("a/folder/with/files")).to(equal(false))
            }
        }
        
        describe(".entries(path:)") {
            let entriesDir = "entries"
            let files = ["hello.swift", "world.rb"]

            beforeEach {
                FileUtils.mkdir_p(entriesDir)
                files.map { File.join(entriesDir, $0) }.each { FileUtils.touch($0) }
            }

            afterEach {
                FileUtils.rm_rf(entriesDir)
            }
            
            it("returns an array containing all named filenames.") {
                expect(Dir.entries(entriesDir)).to(equal([".", ".."] + files))
            }
            
            it("returns an empty array with not existing folder.") {
                expect(Dir.entries("wtf/directory")).to(equal([]))
            }
        }
    }
}
