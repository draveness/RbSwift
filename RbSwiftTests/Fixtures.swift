//
//  FixtureFinder.swift
//  RbSwift
//
//  Created by draveness on 17/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation
import RbSwift

class Fixture {
    static func name(_ name: String) -> String {
        return Bundle(for: self).path(forResource: File.basename(name, ".*"), ofType: File.extname(name))!
    }
    
    static func open(_ name: String, _ mode: String = "r") -> File {
        return File.open(Fixture.name(name), mode)
    }
}
