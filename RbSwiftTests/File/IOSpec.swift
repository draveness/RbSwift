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
    }
}
