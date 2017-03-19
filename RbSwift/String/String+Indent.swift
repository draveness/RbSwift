//
//  Indent.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// MARK: - Indent
public extension String {
    /// Indents the lines in the receiver
    ///
    /// - Parameters:
    ///   - amount: A int specifies the amount of indentString for one level idnentation
    ///   - indentString: A string specifies which indent string to use. The default is \t.
    /// - Returns: A string indented with current methods
    func indent(_ amount: Int, _ indentString: String = "\t") -> String {
        let comps = self.components(separatedBy: "\n")
        return comps.map { amount * indentString + $0.lstrip }.joined(separator: "\n")
    }
    
    /// Indents the lines in the receiver and changes self
    ///
    /// - Parameters:
    ///   - amount: A int specifies the amount of indentString for one level idnentation
    ///   - indentString: A string specifies which indent string to use. The default is \t.
    mutating func indented(_ amount: Int, _ indentString: String = "\t") {
        self = indent(amount, indentString)
    }
}
