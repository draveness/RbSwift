//
//  Enumeration.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    func eachLine(_ separator: String = "\n", closure: (String) -> Void) {
        var lines = components(separatedBy: separator)
        for (index, line) in lines.enumerated() {
            if index != lines.count - 1 {
                lines[index] = line + separator
            }
        }
        lines.filter { $0.length > 0 }.forEach(closure)
    }
    
    func eachChar(closure: (String) -> Void) {
        for char in self.characters {
            closure("\(char)")
        }
    }
}
