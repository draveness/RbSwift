//
//  Dir.swift
//  RbSwift
//
//  Created by draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class Dir {
    /// Returns the path to the current working directory of this process as a string.
    public static var getwd: String {
        let fileManager = FileManager.default
        return fileManager.currentDirectoryPath
    }
    
    /// Returns the path to the current working directory of this process as a string.
    /// An alias to `Dir#getwd` var.
    public static var pwd: String {
        return getwd
    }
    
    public static func glob(_ pattern: String) -> [String] {
        return []
    }
    
    /// Returns the home directory of the current user or the named user if given.
    ///
    /// - Parameter path: The name of user.
    /// - Returns: Home directory.
    public static func home(_ path: String = "~") -> String {
        return (path as NSString).expandingTildeInPath
    }
}
