//
//  Stat.swift
//  RbSwift
//
//  Created by draveness on 22/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

// from <sys/stat.h> (not in Foundation)

/* File mode */
/* Read, write, execute/search by owner */
private let S_IRWXU: Int = 0o000700		/* [XSI] RWX mask for owner */
private let S_IRUSR: Int = 0o000400		/* [XSI] R for owner */
private let S_IWUSR: Int = 0o000200		/* [XSI] W for owner */
private let S_IXUSR: Int = 0o000100		/* [XSI] X for owner */
/* Read, write, execute/search by group */
private let S_IRWXG: Int = 0o000070		/* [XSI] RWX mask for group */
private let S_IRGRP: Int = 0o000040		/* [XSI] R for group */
private let S_IWGRP: Int = 0o000020		/* [XSI] W for group */
private let S_IXGRP: Int = 0o000010		/* [XSI] X for group */
/* Read, write, execute/search by others */
private let S_IRWXO: Int = 0o000007		/* [XSI] RWX mask for other */
private let S_IROTH: Int = 0o000004		/* [XSI] R for other */
private let S_IWOTH: Int = 0o000002		/* [XSI] W for other */
private let S_IXOTH: Int = 0o000001		/* [XSI] X for other */

private let S_ISUID: Int = 0o004000		/* [XSI] set user id on execution */
private let S_ISGID: Int = 0o002000		/* [XSI] set group id on execution */
private let S_ISVTX: Int = 0o001000		/* [XSI] directory restrcted delete */

private let S_IFMT : Int = 0o170000		/* [XSI] type of file mask */
private let S_IFIFO: Int = 0o010000		/* [XSI] named pipe (fifo) */
private let S_IFCHR: Int = 0o020000		/* [XSI] character special */
private let S_IFDIR: Int = 0o040000		/* [XSI] directory */
private let S_IFBLK: Int = 0o060000		/* [XSI] block special */
private let S_IFREG: Int = 0o100000		/* [XSI] regular */
private let S_IFLNK: Int = 0o120000		/* [XSI] symbolic link */
private let S_IFSOCK:Int = 0o140000		/* [XSI] socket */

public class Stat {
    private var info = stat()
    
    /// Creates a `Stat` instance with `fstat` locatated in Darwin library.
    /// Internal uses `fstat` to extract `Stat` information from specific file 
    /// descriptor.
    ///
    /// - Parameter fileno: A file number
    public init(_ fileno: Int) {
        fstat(fileno.to_i32, &info)
    }
    
//    public var atime: Date 
    
//    public var birthtime: Date
    
    /// Returns the native file system’s block size.
    public var blksize: Int {
        return info.st_blksize.to_i
    }
    
    /// Returns true if the file is a block device, false if it isn’t or if the
    /// operating system doesn’t support this feature.
    public var isBlockdev: Bool {
        return mode & S_IFMT == S_IFBLK
    }
    
    /// Returns the number of native file system blocks allocated for this file.
    public var blocks: Int {
        return info.st_blocks.to_i
    }
    
    /// Returns true if the file is a character device, false if it isn’t or if the
    /// operating system doesn’t support this feature.
    public var isChardev: Bool {
        return mode & S_IFMT == S_IFCHR
    }
    
//    public var ctime: Date
    
    /// Returns an integer representing the device on which stat resides.
    public var dev: Int {
        return info.st_dev.to_i
    }
    
    /// Returns true if the named file is a directory, or a symlink that points at a
    /// directory, and false otherwise.
    public var isDirectory: Bool {
        return mode & S_IFMT == S_IFDIR
    }
    
    /// Returns true if stat is executable or if the operating system doesn’t distinguish
    /// executable files from nonexecutable files. The tests are made using the effective
    /// owner of the process.
    public var isExecutable: Bool {
        if geteuid() == 0 {
            return true
        }
        return true
    }
    
    /// Returns the numeric group id of the owner of stat.
    public var gid: Int {
        return info.st_gid.to_i
    }
    
    /// Returns true if the effective group id of the process is the same as the group id
    /// of stat.
    public var isGroupOwned: Bool {
        let egid = gid_t(getegid())
        var groups = [gid_t](repeating: 0, count: 1000)
        let gcount = getgroups(groups.count.to_i32, &groups)
        
        for index in 0..<gcount.to_i {
            if groups[index] == egid {
                return true
            }
        }
        
        return false
    }
    
    /// Returns the inode number for stat.
    public var ino: Int {
        return info.st_ino.to_i
    }
    
//    public var inspect: String {
//        
//    }
    
    /// Returns an integer representing the permission bits of stat.
    public var mode: Int {
        return info.st_mode.to_i
    }
    
//    public var mtime: Date
    
    /// Returns the number of hard links to stat.
    public var nlink: Int {
        return info.st_nlink.to_i
    }
    
    public var isOwned: Bool {
        return geteuid() == info.st_uid
    }
    
    public var isPipe: Bool {
        return mode & S_IFMT == S_IFIFO
    }
    
    /// Returns an integer representing the device type on which stat resides.
    public var rdev: Int {
        return info.st_rdev.to_i
    }
    
//    public var isReadable: Bool {
//    }
    
    /// Returns true if stat has the set-group-id permission bit set, false if it
    /// doesn’t or if the operating system doesn’t support this feature.
    public var isSetgid: Bool {
        return mode & S_ISGID != 0
    }
    
    /// Returns true if stat has the set-user-id permission bit set, false if it 
    /// doesn’t or if the operating system doesn’t support this feature.
    public var isSetuid: Bool {
        return mode & S_ISUID != 0
    }
    
    /// Returns the size of stat in bytes.
    public var size: Int {
        return info.st_size.to_i
    }
    
    /// Returns true if stat is a socket, false if it isn’t or if the operating system 
    /// doesn’t support this feature.
    public var isSocket: Bool {
        return mode & S_IFMT == S_IFSOCK
    }
    
    /// Returns true if stat has its sticky bit set, false if it doesn’t or if the 
    /// operating system doesn’t support this feature.
    public var isSticky: Bool {
        return mode & S_ISVTX != 0
    }
    
    /// Returns true if stat is a symbolic link, false if it isn’t or if the operating 
    /// system doesn’t support this feature.
    public var isSymlink: Bool {
        return mode & S_IFMT == S_IFLNK
    }
    
    public var uid: Int {
        return info.st_uid.to_i
    }
    
//    public var isWritable: Bool 
    
    /// Returns true if stat is a zero-length file; false otherwise.
    public var isZero: Bool {
        return info.st_size == 0
    }
}
