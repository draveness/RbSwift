//
//  String+Chars.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    /// Returns all characters in string form intead of characters form
    var chars: [String] {
        return split("")
    }
}
