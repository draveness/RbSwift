//
//  Sequence+Bool.swift
//  RbSwift
//
//  Created by draveness on 22/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Bool
public extension Sequence {
    /// Returns true if self contains no elements.
    ///
    ///     [].isEmpty      #=> true
    ///     [1].isEmpty     #=> false
    ///
    var isEmpty: Bool {
        return self.count == 0
    }
    
    /// Passes each element of the collection to the given block. The method returns
    /// `true` if the block ever returns a value other than false.
    ///
    ///     [1, 2, 3].isAny { $0 == 1 }             #=> true
    ///     ["a", "b", "c"].isAny { $0 == "b" }     #=> true
    ///     [1, 2, 3].isAny { $0 == 100 }           #=> false
    ///     ["a", "b", "c"].isAny { $0 == "d" }     #=> false
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates there is an element cause the block to return true
    func isAny(_ closure: (Self.Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try reduce(false) { (result, element) in
            return try closure(element) || result
        }
    }
    
    /// Passes each element of the collection to the given block.
    /// The method returns true if the block never returns false.
    ///
    ///     [1, 2, 3].isAll { $0.isPositive }       #=> true
    ///     ["a", "a", "a"].isAll { $0 == "a" }     #=> true
    ///     [1, 2, 3].isAll { $0 == 100 })          #=> false
    ///     ["a", "b", "c"].isAll { $0 == "bbb" }   #=> false
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates all the elements in array cause the block to return true
    func isAll(_ closure: (Self.Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try reduce(true) { (result, element) in
            return try closure(element) && result
        }
    }
}
