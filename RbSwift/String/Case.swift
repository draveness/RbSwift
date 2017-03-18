//
//  Case.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    var downcase: String {
        return self.lowercased()
    }
    
    mutating func downcased() {
        self = downcase
    }
    
    var upcase: String {
        return self.uppercased()
    }
    
    mutating func upcased() {
        self = upcase
    }
    
    var swapcase: String {
        return self.split("").map { $0.isUpcase ? $0.downcase : $0.upcase }.joined()
    }
}
