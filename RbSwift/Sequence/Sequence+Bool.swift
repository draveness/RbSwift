//
//  Sequence+Bool.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Sequence {
    /// Returns true if self contains no elements.
    var isEmpty: Bool {
        return self.count == 0
    }
}
