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

public extension Array where Element == String {
    /// Converts the array to a comma-separated sentence where the last element is
    /// joined by the connector word.
    ///
    /// 	[].to_sentence                          #=> ""
    /// 	["one"].to_sentence                     #=> "one"
    /// 	["one", "two"].to_sentence              #=> "one and two"
    /// 	["one", "two", "three"].to_sentence		#=> "one, two, and three"
    /// 	["one", "two"].to_sentence(twoWordsConnector: "-")		#=> "one-two"
    /// 	["one", "two", "three"].to_sentence(wordsConnector: " or ", lastWordConnector: " or at least ")	
    ///         #=> "one or two or at least three"
    ///
    var to_sentence: String {
        return to_sentence()
    }
    
    /// Converts the array to a comma-separated sentence where the last element is 
    /// joined by the connector word.
    ///
    /// 	[].to_sentence                          #=> ""
    /// 	["one"].to_sentence                     #=> "one"
    /// 	["one", "two"].to_sentence              #=> "one and two"
    /// 	["one", "two", "three"].to_sentence		#=> "one, two, and three"
    /// 	["one", "two"].to_sentence(twoWordsConnector: "-")		#=> "one-two"
    /// 	["one", "two", "three"].to_sentence(wordsConnector: " or ", lastWordConnector: " or at least ")
    ///         #=> "one or two or at least three"
    ///
    /// - Parameters:
    ///   - wordsConnector: The sign or word used to join the elements in
    ///arrays with two or more elements (default: ", ").
    ///   - twoWordsConnector: The sign or word used to join the elements n arrays with two elements (default: " and ").
    ///   - lastWordConnector: The sign or word used to join the last element in arrays with three or more elements (default: ", and ").
    /// - Returns: A sentence joined the array of string into an human-readable sentence.
    func to_sentence(wordsConnector: String = ", ", twoWordsConnector: String = " and ", lastWordConnector: String = ", and ") -> String {
        switch length {
        case 0:
            return ""
        case 1:
            return "\(self.first!)"
        case 2:
            return "\(self.first!)\(twoWordsConnector)\(self.second)"
        default:
            return "\(first(length - 1).join(wordsConnector))\(lastWordConnector)\(self.last!)"
        }
    }
}
