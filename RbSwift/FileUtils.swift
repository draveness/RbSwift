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

    @discardableResult public static func touch(_ path: String) -> Bool {
        return FileManager.default.createFile(atPath: path, contents: nil, attributes: [:])
    }
}
