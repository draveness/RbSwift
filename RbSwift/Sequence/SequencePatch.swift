//
//  Sequence+Patch.swift
//  SwiftPatch
//
//  Created by Draveness on 17/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation



public extension Sequence {
    func select(closure: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var result: [Iterator.Element] = []
        for item in self {
            if closure(item) {
                result.append(item)
            }
        }
        return result
    }
    
    func collect<T>(closure: (Iterator.Element) -> T) -> [T] {
        var result: [T] = []
        for item in self {
            result.append(closure(item))
        }
        return result
    }
    
    func concat(_ other: [Iterator.Element]) -> [Iterator.Element] {
        return self + other
    }
    
    func count(closure: (Iterator.Element) -> Bool) -> Int {
        return self.filter(closure).count
    }
}

public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

public extension Sequence where Iterator.Element: OptionalType {
    var compact: [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                print(element)
                result.append(element)
            }
        }
        return result
    }
}

public extension Sequence where Iterator.Element: Equatable {
    func isAny(obj: Iterator.Element) -> Bool {
        guard let _ = self.first(where:{$0 == obj}) else { return false }
        return true
    }
    
    func isAll(obj: Iterator.Element) -> Bool {
        if let _ = self.first(where:{$0 != obj}) { return false }
        return true
    }
}

public extension Sequence where Iterator.Element : Sequence {
    var flatten: FlattenSequence<Self> {
        return self.joined()
    }
}

