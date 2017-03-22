//
//  Array+Operator.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public func &<T: Equatable>(left: Array<T>, right: Array<T>) -> Array<T> {
    let lhs = left
    var rhs = right
    
    var result: [T] = []
    for l in lhs {
        for (index, r) in rhs.enumerated() {
            if l == r {
                result.append(l)
                rhs.remove(at: index)
                break
            }
        }
        
    }
    return result
}

public func *<T>(left: Array<T>, right: Int) -> Array<T> {
    var result: [T] = []
    for _ in 1...right {
        result += left
    }
    return result
}

public func *<T>(left: Array<T>, right: String) -> String {
    return left.map { "\($0)" }.joined(separator: right)
}

public func -<T: Equatable>(left: Array<T>, right: Array<T>) -> Array<T> {
    var lhs = left
    let rhs = right
    
    for (index, l) in lhs.enumerated() {
        for r in rhs {
            if l == r {
                lhs.remove(at: index)
            }
        }
    }
    return lhs
}
