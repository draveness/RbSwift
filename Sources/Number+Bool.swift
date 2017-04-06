//
//  Number+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Integer {
    /// Receiver integer is 0.
    var isZero: Bool {
        return self == 0
    }
    
    /// Receiver integer is greater than 0.
    var isPositive: Bool {
        return self > 0
    }
    
    /// Receiver integer is less than 0.
    var isNegative: Bool {
        return self < 0
    }

    /// Receiver integer is dividing evenly.
    var isEven: Bool {
        return self % 2 == 0
    }
    
    /// Receiver integer is not dividing evenly.
    var isOdd: Bool {
        return !isEven
    }    
}


