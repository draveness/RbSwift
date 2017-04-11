//
//  FileSpec.swift
//  RbSwift
//
//  Created by Draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Quick
import Nimble
import RbSwift

class FileSpec: QuickSpec {
    override func spec() {
        describe(".basename(filename:)") {
            it("returns the last component of the filename given in filename") {
                expect(File.basename("/home/work/file.swift")).to(equal("file.swift"))
                expect(File.basename("/home/work/file.swift", ".swift")).to(equal("file"))
                expect(File.basename("/home/work/file.swift", ".*")).to(equal("file"))
                expect(File.basename("/home/work/file.rb", ".*")).to(equal("file"))
            }
        }
        
        describe(".dirname(filename:)") {
            it("returns all components of the filename given in filename except the last one") {
                expect(File.dirname("/home/work/file.swift")).to(equal("/home/work"))
            }
        }
        
        describe(".extname(path:)") {
            it("returns the extension (the portion of file name in path starting from the last period.") {
                expect(File.extname("test.rb")).to(equal(".rb"))
                expect(File.extname("a/b/d/test.rb")).to(equal(".rb"))
                expect(File.extname(".a/b/d/test.rb")).to(equal(".rb"))
                expect(File.extname("foo.")).to(equal(""))
                expect(File.extname("test")).to(equal(""))
                expect(File.extname(".profile")).to(equal(""))
                expect(File.extname(".profile.sh")).to(equal(".sh"))
            }
        }
        
        describe(".expand(path:in:)") {
            it("converts a pathname to an absolute pathname.") {
                expect(File.expand("~/file.swift")).to(equal(Dir.home + "/file.swift"))
                expect(File.expand("file.swift", in: "/usr/bin")).to(equal("/usr/bin/file.swift"))
                expect(File.expand("./file.swift")).to(equal(Dir.pwd + "/file.swift"))
            }
        }
        
        describe(".absolutePath(path:)") {
            it("converts a pathname to an absolute pathname.") {
                expect(File.absolutePath("~/file.swift")).to(equal(Dir.home + "/file.swift"))
                expect(File.absolutePath("./file.swift")).to(equal(Dir.pwd + "/file.swift"))
            }
        }
    }
}
