//
//  Array+Operator.swift
//  RbSwift
//
//  Created by draveness on 21/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public func &<T: Equatable>(left: [T], right: [T]) -> [T] {
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

public func *<T>(left: [T], right: Int) -> [T] {
    var result: [T] = []
    right.times { result += left }
    return result
}

public func *<T>(left: [T], right: String) -> String {
    return left.map { "\($0)" }.join(right)
}

public func -<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
    return lhs.reject { rhs.contains($0) }
}

public func ==<Element : Equatable> (lhs: [[Element]], rhs: [[Element]]) -> Bool {
    return lhs.elementsEqual(rhs, by: ==)
}
