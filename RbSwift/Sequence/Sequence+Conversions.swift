//
//  Sequence+Conversions.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Sequence {
    /// Returns an array with all elements in sequence.
    var to_a: [Self.Iterator.Element] {
        return self.map { $0 }
    }
}
