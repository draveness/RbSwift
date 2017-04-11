//
//  File.swift
//  RbSwift
//
//  Created by Draveness on 10/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class File {
    /// Returns the last component of the filename given in `filename`.
    ///
    /// 	File.basename("/home/work/file.swift")		#=> "file.swift"
    ///
    /// If `suffix` is given and present at the end of `filename`, it is removed.
    ///
    /// 	File.basename("/home/work/file.swift", ".swift")    #=> "file"
    ///
    /// If `suffix` is `.*`, any extension will be removed.
    ///
    /// 	File.basename("/home/work/file.swift", ".*")        #=> "file"
    /// 	File.basename("/home/work/file.rb", ".*")           #=> "file"
    ///
    /// - Parameters:
    ///   - filename: A file path string.
    ///   - suffix: A string will be removed from the filename.
    /// - Returns: The last component with or without extension.
    public static func basename(_ filename: String, _ suffix: String = "") -> String {
        let filename = filename as NSString
        let base = filename.lastPathComponent
        if suffix == ".*" { return (base as NSString).deletingPathExtension }
        let pattern = suffix + "$"
        guard base =~ pattern else { return base }
        return base.gsub(pattern, "")
    }
    
    /// Returns all components of the filename given in `filename` except the last one.
    ///
    /// 	File.dirname("/home/work/file.swift")		#=> "/home/work"
    ///
    /// - Parameter filename: A file path string.
    /// - Returns: The directory of given filename.
    public static func dirname(_ filename: String) -> String {
        let filename = filename as NSString
        return filename.deletingLastPathComponent
    }
    
    /// Returns the extension (the portion of file name in path starting from the last period).
    /// If path is a dotfile, or starts with a period, then the starting dot is not dealt 
    /// with the start of the extension.
    ///
    ///
    /// An empty string will also be returned when the period is the last character in path.
    ///
    /// - Parameter path: A file path.
    /// - Returns: A file extension of empty string.
    public static func extname(_ path: String) -> String {
        let ext = (path as NSString).pathExtension
        guard ext.isEmpty else { return "." + ext }
        return ext
    }
    
    /// Converts a pathname to an absolute pathname. Relative paths are referenced from the current
    /// working directory of the process unless `dir` is given, in which case it will be used as the starting
    /// point. The given pathname may start with a “~”, which expands to the process owner’s home directory 
    /// (the environment variable HOME must be set correctly).
    ///
    ///     let home = Dir.home()
    /// 	File.expand(path: "~/file.swift")                   #=> "/absolute/path/to/home/file.swift"
    /// 	File.expand(path: "file.swift", in: "/usr/bin")		#=> "/usr/bin/file.swift"
    ///
    /// - Parameters:
    ///   - path: A file path.
    ///   - dir: A directory path.
    /// - Returns: A absolute path.
    public static func expand(_ path: String, in dir: String? = nil) -> String {
        var filepath = Pathname(path)
        if let dir = dir {
            filepath = Pathname(dir) + filepath
            return (filepath.path as NSString).standardizingPath
        }
        return File.absolutePath(filepath.path)
    }
    
    public static func absolutePath(_ path: String) -> String {
        let pathname = Pathname(path)
        if pathname.isAbsolute {
            return (path as NSString).standardizingPath
        }
        
        let expandingPath = Pathname((path as NSString).expandingTildeInPath)
        if expandingPath.isAbsolute {
            return (expandingPath.path as NSString).standardizingPath
        }
        
        return (Pathname(Dir.pwd) + pathname).path
    }
    
//    public static func touch(_ path: String) -> File? {
//        
//    }
}
