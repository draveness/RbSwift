//
//  FileUtils.swift
//  RbSwift
//
//  Created by Draveness on 11/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class FileUtils {
    /// Changes the current directory to the directory dir.
    ///
    ///     FileUtils.cd('/', verbose: true)
    ///
    /// If this method is called with block, resumes to the old working directory after
    /// the block execution finished.
    ///
    ///     FileUtils.cd('/') {
    ///         // do somthing.
    ///     }
    ///
    /// - Parameters:
    ///   - dir: A directory path.
    ///   - verbose: A bool value indicates print the child directory.
    ///   - closure: A closure if provided would execute in new directory and resume the old directory
    ///              after executing.
    public static func cd(_ dir: String = "~", verbose: Bool = false, closure: (() -> ())? = nil) {
        let originalPath = Dir.pwd
        Dir.chdir(dir)
        if verbose { print("Change workding directory to \(Dir.pwd))") }
        guard let closure = closure else { return }
        closure()
        Dir.chdir(originalPath)
    }

    /// An alias to `FileUtils.cd(dir:verbose:closure:)`
    ///
    /// - Parameters:
    ///   - dir: A directory path.
    ///   - verbose: A bool value indicates print the child directory.
    ///   - closure: A closure if provided would execute in new directory and resume the old directory
    ///              after executing.
    public static func chdir(_ dir: String = "~", verbose: Bool = false, closure: (() -> ())? = nil) {
        return cd(dir, verbose: verbose, closure: closure)
    }

    /// Removes directories and its all contents recursively.
    ///
    /// - Parameter paths: An array of file path.
    public static func rm_rf(_ paths: String...) {
        do {
            try paths.forEach { try FileManager.default.removeItem(atPath: $0) }
        } catch { }
    }
    
    public static func mkdir_p(_ paths: String...) {
        do {
            try paths.forEach { try Dir.mkdir($0, recursive: true) }
        } catch { }
    }
    
    public static func touch(_ paths: String...) {
        touch(paths)
    }
    
    public static func touch(_ paths: [String]) {
        paths.forEach { FileManager.default.createFile(atPath: $0, contents: nil, attributes: [:]) }
    }
}
