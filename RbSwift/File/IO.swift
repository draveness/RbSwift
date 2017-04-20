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
    public var file: UnsafeMutablePointer<FILE> {
        get {
            return _file
        }
    }
    
    public var lineno = 0
    
    init(file: UnsafeMutablePointer<FILE>) {
        self._file = file
    }
    
    /// Synonym for IO.new.
    ///
    /// - Parameters:
    ///   - fd: A file descriptor.
    ///   - mode: A string mode.
    /// - Returns: An IO stream.
    /// - SeeAlso: IO.new
    open class func forfd(_ fd: Int, mode: String) -> IO {
        return new(fd, mode: mode)
    }
    
    /// Returns a new IO object (a stream) for the given integer file descriptor fd 
    /// and mode string. opt may be used to specify parts of mode in a more readable fashion.
    ///
    /// - Parameters:
    ///   - fd: A file descriptor.
    ///   - mode: A string mode.
    /// - Returns: An IO stream.
    open class func open(_ fd: Int, mode: String = "r")  -> IO {
        return new(fd, mode: mode)
    }

    /// With no associated block, `IO.open` is a synonym for `IO.new`. If the optional 
    /// code block is given, it will be passed io as an argument, and the IO object will 
    /// automatically be closed when the block terminates.
    ///
    /// - Parameters:
    ///   - fd: A file descriptor.
    ///   - mode: A string mode.
    /// - Returns: An IO stream.
    open class func new(_ fd: Int, mode: String = "r", closure: ((Void) -> ())? = nil) -> IO {
        let io = IO(file: fdopen(Int32(fd), mode))
        if let closure = closure {
            defer { io.close() }
            closure()
        }
        return io
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
    public func read(_ length: Int = Int.max) -> String {
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
    @discardableResult
    public func write(_ string: String) -> Int {
        return fwrite(string, 1, string.length, file)
    }

    /// Reads the next “line” from the I/O stream; lines are separated by sep. 
    /// A separator of nil and a zero-length separator reads the entire contents.
    ///
    ///     let file = File.open("file.txt")
    ///     file.gets()     #=> "first line\n"
    ///     file.gets("s")  #=> "s"
    ///     file.gets()     #=> "econd line\n"
    ///
    /// - Parameter sep: A string separator.
    /// - Returns: A string value or nil.
    @discardableResult
    public func gets(_ sep: String? = "\n") -> String? {
        guard let sep = sep?.first, sep.length.isPositive else { return read() }
        if sep == "\n" {
            let buffer = [CChar](repeating: 0, count: 1024)
            guard let _ = fgets(UnsafeMutablePointer(mutating: buffer), buffer.count.to_i32, file) else { return nil }
            lineno += 1
            return buffer.withUnsafeBufferPointer { ptr in
                String(cString: ptr.baseAddress!)
            }
        } else {
            var buffer: String = ""
            while true {
                guard let char = getc else { break }
                if char == "\n" { lineno += 1 }
                buffer.append(char)
                if char == sep { break }
            }
            return buffer
        }
    }
    
    /// Reads a one-character string from ios. Returns nil if called at end of file.
    public var getc: String? {
        let char = fgetc(file).to_i
        if char == -1 {
            return nil
        }
        return char.chr
    }
    
    /// Flushes any buffered data within ios to the underlying operating system.
    ///
    /// - Returns: An int return value for `fflush`.
    @discardableResult
    public func flush() -> Int {
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
    public func seek(_ offset: Int, whence: SeekPosition = .set) {
        fseek(file, offset, whence.to_i())
    }
        
    /// Closes I/O stream and flushes any pending writes to the operating system.
    ///
    /// - Returns: A status.
    @discardableResult
    public func close() -> Int {
        return fclose(file).to_i
    }
    
    /// Returns an integer representing the numeric file descriptor for I/O stream.
    public var fileno: Int {
        return Darwin.fileno(file).to_i
    }
    
    /// An alias to `fileno` var.
    public var to_i: Int {
        return fileno
    }
    
    /// Returns true if I/O stream is associated with a terminal device (tty), false otherwise.
    public var isatty: Bool {
        return Darwin.isatty(fileno.to_i32) != 0
    }
    
    /// The current offset (in bytes) of ios. Set this var to seek to the given position (in bytes) in
    /// ios. It is not guaranteed that seeking to the right position when ios is textmode.
    public var pos: Int {
        get {
            return ftell(file).to_i
        }
        set {
            seek(newValue)
        }
    }
}
