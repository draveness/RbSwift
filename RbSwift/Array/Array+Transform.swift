//
//  Array+Patch.swift
//  SwiftPatch
//
//  Created by draveness on 16/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Array {
    mutating func clear() -> [Element] {
        self = []
        return self
    }
    
    func combination(_ num: Int) -> [[Element]] {
        guard num.isPositive && !self.isEmpty else { return [] }
        guard num <= self.length else { return [[]] }
        var bits = Array<Int>(Array<Int>(0..<num).reversed())
        
        func lastBit() -> Int? {
            for (index, bit) in bits.enumerated() {
                if bit + index < self.length - 1 {
                    bits[index] += 1
                    return bit
                }
            }
            return nil
        }
        
        var results: [[Element]] = []
        
        while true {
            var result: [Element] = []
            for index in bits.reversed() {
                result.append(self[index])
            }
            results.append(result)
            if lastBit() == nil {
                break
            }
        }
        return results
    }
    
    func dig<T>(_ idxs: Int...) -> T? {
        return dig(idxs)
    }
    
    func dig<T>(_ idxs: [Int]) -> T? {
        guard self.length > 0 && idxs.count > 0 else { return nil }
        let firstIdx = idxs.first!
        let element = self[firstIdx]
        if let element = element as? [T] {
            return element.dig(idxs.drop(1))
        } else if idxs.count == 1 {
            return element as? T
        } else {
            return nil
        }
    }
}

public extension Array where Element: Equatable {
    mutating func delete(_ obj: Element, all: Bool = true) -> Element? {
        var indexes: [Int] = []
        for (index, item) in self.enumerated() {
            if item == obj {
                indexes.append(index)
            }
        }
        
        guard indexes.count > 0 else { return nil }
        
        if !all {
            indexes = [indexes.first!]
        }
        
        for index in indexes.reversed() {
            self.remove(at: index)
        }
        
        return obj
    }
}

