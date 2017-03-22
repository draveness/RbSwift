//
//  Sequence+Conversions.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Sequence {
    var to_a: [Iterator.Element] {
        return self.map { $0 }
    }
}
