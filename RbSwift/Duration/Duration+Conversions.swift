//
//  Duration+Conversions.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Duration {        
    var to_s: String {
        return "\(toSeconds)"
    }
    
    var to_i: Int {
        return toSeconds
    }
}
