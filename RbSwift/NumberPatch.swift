//
//  Number+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Integer {
    var to_s: String {
        return "\(self)"
    }
    
    var zero: Bool {
        return isZero
    }
    
    var isZero: Bool {
        return self == 0
    }
    
    var isPositive: Bool {
        return self > 0
    }
    
    var isNegative: Bool {
        return self < 0
    }

    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return !isEven
    }    
}


