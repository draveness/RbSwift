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
    var isEmpty: Bool {
        return self.count == 0
    }
    
    /// Passes each element of the collection to the given block. The method returns
    /// `true` if the block ever returns a value other than false.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates there is an element cause the block to return true
    func isAny(closure: (Iterator.Element) -> Bool) -> Bool {
        return reduce(false) { (result, element) in
            return result || closure(element)
        }
    }
    
    /// Passes each element of the collection to the given block.
    /// The method returns true if the block never returns false.
    ///
    /// - Parameter closure: A block accepts element in the receiver and returns a bool value
    /// - Returns: A bool value indicates all the elements in array cause the block to return true
    func isAll(closure: (Iterator.Element) -> Bool) -> Bool {
        return reduce(true) { (result, element) in
            return result && closure(element)
        }
    }
}
