//
//  FileUtils.swift
//  RbSwift
//
//  Created by Draveness on 11/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class FileUtils {
    @discardableResult public static func touch(_ path: String) -> Bool {
        return FileManager.default.createFile(atPath: path, contents: nil, attributes: [:])
    }
}
