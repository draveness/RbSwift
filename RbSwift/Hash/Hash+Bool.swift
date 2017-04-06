//
//  Hash+Bool.swift
//  RbSwift
//
//  Created by draveness on 06/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Hash {
    func isAny(closure: (Key, Value) -> Bool) -> Bool {
        return reduce(false) { (result, element) in
            return result || closure(element.key, element.value)
        }
    }
}
