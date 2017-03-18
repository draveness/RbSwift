//
//  Indent.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    func indent(_ amount: Int, _ indentString: String = "\t") -> String {
        let comps = self.components(separatedBy: "\n")
        return comps.map { amount * indentString + $0.lstrip }.joined(separator: "\n")
    }
}
