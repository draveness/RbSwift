//
//  IO.swift
//  RbSwift
//
//  Created by draveness on 17/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation
import Darwin

public class IO {
    private var _file: UnsafeMutablePointer<FILE>?
    open var file: UnsafeMutablePointer<FILE>? {
        get {
            return _file
        }
    }
    
    init(file: UnsafeMutablePointer<FILE>) {
        self._file = file
    }
    
    open class func forfd(_ fd: Int, mode: String) -> IO {
        return IO(file: fdopen(Int32(fd), mode))
    }
    
    open class func open(_ fd: Int, mode: String = "r") -> IO {
        return forfd(fd, mode: mode)
    }

    open class func new(_ fd: Int, mode: String) -> IO {
        return open(fd, mode: mode)
    }

    open class func read(_ name: String, length: Int = Int.max, offset: Int? = nil) -> String {
        let file = File.open(name)
        if let offset = offset {
            file.seek(offset)
        }
        return file.read(length)
    }
    
    @discardableResult open class func write(_ name: String, _ string: String, offset: Int? = nil) -> Int {
        return 1
    }
    
    /// Reads length bytes from the I/O stream.
    /// Length must be a non-negative integer or `File#read` will return 
    /// empty string.
    ///
    /// - Parameter length: The length of bytes from I/O stream.
    /// - Returns: A string read from the I/O Stream.
    open func read(_ length: Int = Int.max) -> String {
        guard length.isPositive else { return "" }
        let buffer = [CChar](repeating: 0, count: 1024)
        var result = ""
        while result.length < length && fgets(UnsafeMutablePointer(mutating: buffer), Int32(buffer.count), file) != nil {
            buffer.withUnsafeBufferPointer { ptr in
                result += String(cString: ptr.baseAddress!)
            }
        }
        return result.to(length)!
    }
    
    /// An enum valu as the mapping of `SEEK_SET/SEEK_CUR/SEEK_END`
    ///
    /// - set: SEEK_SEK
    /// - cur: SEEK_CUR
    /// - end: SEEK_END
    public enum SeekPosition {
        case set
        case cur
        case end
        
        func to_i() -> Int32 {
            switch self {
            case .set:
                return SEEK_SET
            case .cur:
                return SEEK_CUR
            case .end:
                return SEEK_END
            }
        }
    }
    
    /// Seeks to a given `offset` in the stream according to the value of whence.
    ///
    /// - Parameters:
    ///   - offset: An integer offset.
    ///   - whence: An whenece
    /// - SeeAlso: SeekPosition
    open func seek(_ offset: Int, whence: SeekPosition = .set) {
        fseek(file, offset, whence.to_i())
    }
}
