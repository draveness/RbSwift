//
//  Stat.swift
//  RbSwift
//
//  Created by draveness on 22/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class Stat {
    public var info = stat()
    
    /// Creates a `Stat` instance with `fstat` locatated in Darwin library.
    /// Internal uses `fstat` to extract `Stat` information from specific file 
    /// descriptor.
    ///
    /// - Parameter fileno: A file number
    public init(_ fileno: Int) {
        fstat(fileno.to_i32, &info)
    }
    
    public var mode: Int {
        return info.st_mode.to_i
    }
}
