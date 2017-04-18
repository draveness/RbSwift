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
    
    open var lineno = 0
    
    init(file: UnsafeMutablePointer<FILE>) {
        self._file = file
    }
    
    open class func forfd(_ fd: Int, mode: String) -> IO {
        return IO(file: fdopen(Int32(fd), mode))
    }
    
    open class func open(_ fd: Int, mode: String = "r") -> IO {
        return new(fd, mode: mode)
    }

    open class func new(_ fd: Int, mode: String = "r") -> IO {
        return forfd(fd, mode: mode)
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
        file.seek(offset)
        return file.read(length)
    }
    
    /// Opens the file with `File#open` and writes the given string to I/O stream.
    /// The stream must be opened for writing.
    ///
    /// - Parameters:
    ///   - name: The name of a file.
    ///   - string: A string to write to the specific file.
    ///   - offset: The starting position of the I/O Stream.
    ///   - mode: A string for `File#open`
    /// - Returns: The number of bytes written.
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
        while result.length < length && fgets(UnsafeMutablePointer(mutating: buffer), buffer.count.to_i32, file) != nil {
            buffer.withUnsafeBufferPointer { ptr in
                result += String(cString: ptr.baseAddress!)
            }
        }
        return result.to(length)!
    }
    
    /// Writes the given string to I/O stream. The stream must be opened for writing.
    ///
    ///     File.open("empty.txt", "w") { file in
    ///         file.write("Content")   #=> 7
    ///     }
    ///
    /// - Parameter string: A string written to I/O Stream.
    /// - Returns: The number of bytes written.
    @discardableResult open func write(_ string: String) -> Int {
        return fwrite(string, 1, string.length, file)
    }
    
    static open let newline = Int8("\n".ord)
    static open let retchar = Int8("\r".ord)

//    func gets(_ sep: String = "\n") -> String? {
//        let buffer = [CChar](repeating: 0, count: 1024)
//        if fgets(UnsafeMutablePointer(mutating: buffer), buffer.count.to_i32, file) == nil {
//            return nil
//        }
//        lineno += 1
//        data.length = Int(strlen( data.bytes ))
//        if data.length > 0 && data.bytes[data.length-1] == IO.newline {
//            data.length -= 1
//            data.bytes[data.length] = 0
//        }
//        if data.length > 0 && data.bytes[data.length-1] == IO.retchar {
//            data.length -= 1
//            data.bytes[data.length] = 0
//        }
//        return data.to_s
//    }
    
    /// Flushes any buffered data within ios to the underlying operating system.
    ///
    /// - Returns: An int return value for `fflush`.
    @discardableResult open func flush() -> Int {
        return fflush(file).to_i
    }

    /// An enum value as the mapping of `SEEK_SET/SEEK_CUR/SEEK_END`
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
                return offset.to_i32
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
        
    /// Closes I/O stream and flushes any pending writes to the operating system.
    ///
    /// - Returns: A status.
    @discardableResult open func close() -> Int {
        return fclose(file).to_i
    }
    
    /// Returns an integer representing the numeric file descriptor for I/O stream.
    open var fileno: Int {
        return Darwin.fileno(file).to_i
    }
    
    /// An alias to `fileno` var.
    open var to_i: Int {
        return fileno
    }
    
    /// Returns true if I/O stream is associated with a terminal device (tty), false otherwise.
    open var isatty: Bool {
        return Darwin.isatty(fileno.to_i32) != 0
    }
    
    /// The current offset (in bytes) of ios. Set this var to seek to the given position (in bytes) in
    /// ios. It is not guaranteed that seeking to the right position when ios is textmode.
    open var pos: Int {
        get {
            return ftell(file).to_i
        }
        set {
            seek(newValue)
        }
    }
}
