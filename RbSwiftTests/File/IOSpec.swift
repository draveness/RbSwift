//
//  IOSpec.swift
//  RbSwift
//
//  Created by draveness on 17/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class IOSpec: BaseSpec {
    override func spec() {
        describe("#read(name:)") {
            it("reads length bytes from the I/O stream.") {
                let file = Fixture.name("RbSwift.txt")
                expect(File.read(file)).to(equal("RbSwift\n"))
                expect(File.read(file, offset: 1)).to(equal("bSwift\n"))
                expect(File.read(file, offset: 100)).to(equal(""))
            }
        }
        
        describe(".read(name:)") {
            it("reads length bytes from the I/O stream.") {
                let file = Fixture.open("RbSwift.txt")
                expect(file.read()).to(equal("RbSwift\n"))
            }
        }
        
        describe("#write(name:)") {
            it("reads length bytes from the I/O stream.") {
                let file = Fixture.name("empty.txt")
                expect(File.write(file, "content")).to(equal(7))
                expect(File.read(file)).to(equal("content"))
            }
        }
        
        describe(".write(string:)") {
            it("writes the given string to I/O stream.") {
                File.open("empty.txt", "w") { file in
                    file.write("Content")
                }
                let readFile = File.open("empty.txt", "r")
                expect(readFile.read()).to(equal("Content"))
            }
        }
        
        describe(".gets(sep:)") {
            it("reads the next “line” from the I/O stream") {
                let file = Fixture.name("file.txt")
                File.open(file) { file in
                    expect(file.gets()).to(equal("first line\n"))
                    expect(file.gets("s")).to(equal("s"))
                }
                
                File.open(file) { file in
                    expect(file.gets(nil)).to(equal("first line\nsecond line\n"))
                }
            }
        }
        
        describe(".getc") {
            it("reads a one-character string from ios.") {
                let file = Fixture.name("file.txt")
                File.open(file) { file in
                    expect(file.getc!).to(equal("f"))
                }
            }
            
            it("returns nil if called at end of file.") {
                let file = Fixture.name("file.txt")
                File.open(file) { file in
                    file.gets()
                    file.gets()
                    expect(file.getc).to(beNil())
                }
            }
        }
    }
}
