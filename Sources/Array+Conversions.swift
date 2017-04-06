//
//  Array+Conversions.swift
//  RbSwift
//
//  Created by Draveness on 23/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Conversions
public extension Array {
    /// Convert an array of integer to int by base default is 10.
    ///
    ///     [1,2,3].to_i()      #=> 321
    ///     [1,2,3,4].to_i()    #=> 4321
    ///     [0,0,0,1].to_i(2)   #=> 8
    ///
    /// - Parameter base: An integer indicates the integer's base
    /// - Returns: An integer
    func to_i(_ base: Int = 10) -> Int {
        var index = 0
        return flatMap {
            $0 as? Int
        }.reduce(0) { (result, digit) in
            let result = result + digit * (base ** index)
            index += 1
            return result
        }
    }
}
