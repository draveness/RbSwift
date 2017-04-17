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

    open class func read(_ name: String, length: Int? = nil, offset: Int? = nil) -> String {
        let file = File.open(name)
        if let offset = offset {
            file.seek(offset)
        }
        return file.read( length )
    }
    
    open func read(_ length: Int? = nil) -> String {
        let buffer = [CChar](repeating: 0, count: 1024)
        var string = ""
        while fgets(UnsafeMutablePointer(mutating: buffer), Int32(buffer.count), file) != nil {
            buffer.withUnsafeBufferPointer { ptr in
                string += String(cString: ptr.baseAddress!)
            }
        }
        return string
    }
    
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
