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
        return FileManager.default.currentDirectoryPath
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
    ///     Dir.home()       #=> "/Users/username"
    ///     Dir.home("user") #=> "/user"
    ///
    /// - Parameter path: The name of user.
    /// - Returns: Home directory.
    public static func home(_ path: String = "~") -> String {
        let result = (path as NSString).expandingTildeInPath
        guard result.hasPrefix("/") else { return "/" + result }
        return result
    }
    
    /// Changes the current working directory of the process to the given string.
    ///
    ///     Dir.chdir("/var/spool/mail")
    ///     Dir.pwd     #=> "/var/spool/mail"
    ///
    /// - Parameter path: A new current working directory.
    /// - Returns: A bool indicates the result of `Dir#chdir(path:)`
    @discardableResult public static func chdir(_ path: String = "~") -> Bool {
        return FileManager.default.changeCurrentDirectoryPath(path)
    }
    
    /// Changes the current working directory of the process to the given string.
    /// Block is passed the name of the new current directory, and the block
    /// is executed with that as the current directory. The original working directory
    /// is restored when the block exits. The return value of chdir is the value of the block.
    ///
    ///     Dir.pwd         #=> "/work"
    ///     let value = Dir.chdir("/var") {
    ///         Dir.pwd     #=> "/var"
    ///         return 1
    ///     }
    ///     Dir.pwd         #=> "/work"
    ///     value   #=> 1
    ///
    /// - Parameters:
    ///   - path: A new current working directory.
    ///   - closure: A block executed in target directory.
    /// - Returns: The value of the closure.
    @discardableResult public static func chdir<T>(_ path: String = "~", closure: ((Void) -> T)) -> T {
        let pwd = Dir.pwd
        Dir.chdir(path)
        let result = closure()
        Dir.chdir(pwd)
        return result
    }
    
    /// Makes a new directory named by string, with permissions specified by the optional parameter anInteger.
    ///
    ///     try Dir.mkdir("draveness")
    ///     try! Dir.mkdir("draveness/spool/mail", recursive: true)
    ///
    /// - Parameters:
    ///   - path: A new directory path.
    ///   - recursive: Whether creats intermeidate directories.
    ///   - permissions: An integer represents the posix permission.
    /// - Throws: When `FileManager#createDirectory(atPath:withIntermediateDirectories:attributes:)` throws.
    public static func mkdir(_ path: String, recursive: Bool = false, _ permissions: Int? = nil) throws {
        if let permissions = permissions {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: recursive, attributes: [FileAttributeKey.posixPermissions.rawValue: permissions])
        } else {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: recursive, attributes: nil)
        }
    }
}
