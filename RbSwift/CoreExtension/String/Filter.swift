//
//  SwiftPatch.swift
//  SwiftPatch
//
//  Created by draveness on 18/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
    func remove(_ patterns: String...) -> String {
        return remove(patterns)
    }
    
    func remove(_ patterns: [String]) -> String {
        var result = self
        patterns.forEach { result.gsubed($0, "") }
        return result
    }
    
    var squish: String {
        return gsub("\\A[[:space:]]+", "")
            .gsub("[[:space:]]+\\z", "")
            .gsub("[[:space:]]+", " ")
    }
 
    func truncate(_ at: Int, omission: String = "...") -> String {
        if self.length <= omission.length { return self }
        if self.length <= at  { return self }
        return to(at - omission.length - 1)! + omission
    }
}
