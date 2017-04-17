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
    private var _file: UnsafeMutablePointer<FILE>
    open var file: UnsafeMutablePointer<FILE> {
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

    /// Reads length bytes from the I/O stream.
    /// Length must be a non-negative integer or `File#read` will return
    /// empty string.
    ///
    ///     let file = "file.txt"
    /// 	File.read(file)                 #=> "RbSwift\n"
    /// 	File.read(file, offset: 1)		#=> "bSwift\n"
    /// 	File.read(file, offset: 100)		#=> ""
    ///
    /// - Parameters:
    ///   - name: The name of a file.
    ///   - length: The length of bytes from I/O stream.
    ///   - offset: The starting position of the I/O Stream.
    /// - Returns: A string read from the I/O Stream.
    open class func read(_ name: String, length: Int = Int.max, offset: Int = 0) -> String {
        let file = File.open(name)
        defer { file.close() }
        if let offset = offset {
            file.seek(offset)
        }
        return file.read(length)
    }
    
    @discardableResult open class func write(_ name: String, _ string: String, offset: Int = 0, mode: String = "w") -> Int {
        let file = File.open(name, mode)
        defer { file.close() }
        file.seek(offset)
        return file.write(string)
    }
    
    /// Reads length bytes from the I/O stream.
    /// Length must be a non-negative integer or `File#read` will return 
    /// empty string.
    ///
    ///     let file = File.open("file.txt")
    /// 	file.read(file)     #=> "RbSwift\n"
    /// 	file.read(file)		#=> "bSwift\n"
    /// 	file.read(file)		#=> ""
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
    
    /// Writes the given string to ios. The stream must be opened for writing.
    ///
    /// - Parameter string: A string written to I/O Stream.
    /// - Returns: The number of bytes written.
    @discardableResult open func write(_ string: String) -> Int {
        return fwrite(string, 1, string.length, file)
    }
    
    /// An enum valu as the mapping of `SEEK_SET/SEEK_CUR/SEEK_END`
    ///
    /// - set: SEEK_SEK
    /// - cur: SEEK_CUR
    /// - end: SEEK_END
    /// - int: A custom seek position for `IO#seek(offset:whence:)`
    public enum SeekPosition {
        case set
        case cur
        case end
        case int(Int)
        
        func to_i() -> Int32 {
            switch self {
            case .set:
                return SEEK_SET
            case .cur:
                return SEEK_CUR
            case .end:
                return SEEK_END
            case .int(let offset):
                return Int32(offset)
            }
        }
    }
    
    /// Seeks to a given `offset` in the stream according to the value of `whence`.
    ///
    /// - Parameters:
    ///   - offset: An integer offset.
    ///   - whence: An whenece
    /// - SeeAlso: SeekPosition
    open func seek(_ offset: Int, whence: SeekPosition = .set) {
        fseek(file, offset, whence.to_i())
    }
        
    /// Closes ios and flushes any pending writes to the operating system.
    ///
    /// - Returns: A status.
    @discardableResult open func close() -> Int {
        return fclose(file).to_i
    }
}
