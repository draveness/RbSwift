//
//  Array+Ordinal.swift
//  RbSwift
//
//  Created by draveness on 15/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Ordinal
public extension Array {
    /// Equals to `self[1]`.
    var second: Element {
        return self[1]
    }
    
    /// Equals to `self[2]`.
    var third: Element {
        return self[2]
    }
    
    /// Equals to `self[3]`.
    var fourth: Element {
        return self[3]
    }
    
    /// Equals to `self[4]`.
    var fifth: Element {
        return self[4]
    }
    
    /// Equals to `self[5]`.
    var sixth: Element {
        return self[5]
    }
    
    /// Equals to `self[6]`.
    var seventh: Element {
        return self[6]
    }
    
    /// Equals to `self[7]`.
    var eighth: Element {
        return self[7]
    }
    
    /// Equals to `self[8]`.
    var ninth: Element {
        return self[8]
    }
    
    /// Equals to `self[9]`.
    var tenth: Element {
        return self[9]
    }
    
    /// Equals to `self[-2]`
    var secondToLast: Element {
        return self[length-2]
    }
    
    /// Equals to `self[-3]`
    var thirdToLast: Element {
        return self[length-3]
    }
}
