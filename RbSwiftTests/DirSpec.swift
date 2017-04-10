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
                print(Dir.home())
            }
        }
    }
}
