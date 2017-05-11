//
//  Enumerable.swift
//  RbSwift
//
//  Created by draveness on 12/05/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public protocol Enumerable {
    associatedtype Element
    func each(block: (Self.Element) -> Void)
}

extension Enumerable {
    func eachWithIndex(closure: (Int, Self.Element) -> Void) {
        var index = 0
        self.each { (element) in
            closure(index, element)
            index += 1
        }
    }
}
