//
//  FileUtils.swift
//  RbSwift
//
//  Created by Draveness on 11/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class FileUtils {
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
