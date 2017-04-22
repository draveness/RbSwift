//
//  Conversion.swift
//  RbSwift
//
//  Created by draveness on 19/03/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Integer {
    var to_s: String {
        return "\(self)"
    }
}

public extension Int {
    var to_f: Float {
        return Float(self)
    }
    
    var to_double: Double {
        return Double(self)
    }
    
    var to_i: Int {
        return Int(self)
    }
    
    var to_i32: Int32 {
        return Int32(self)
    }
    
    var to_i64: Int64 {
        return Int64(self)
    }
    
    var to_u: UInt {
        return UInt(self)
    }
    
    var to_u32: UInt32 {
        return UInt32(self)
    }
    
    var to_u64: UInt64 {
        return UInt64(self)
    }
    
    var to_bool: Bool {
        if self == 0 { return false }
        return true
    }
    
    /// Returns a string containing the character represented by the int's value according to encoding.
    ///
    ///     97.chr      #=> "a"
    ///     98.chr      #=> "b"
    ///
    var chr: String {
        guard let str = UnicodeScalar(self) else { return "" }
        return "\(str)"
    }
}

public extension Int32 {
    var to_f: Float {
        return Float(self)
    }
    
    var to_double: Double {
        return Double(self)
    }
    
    var to_i: Int {
        return Int(self)
    }
    
    var to_i32: Int32 {
        return Int32(self)
    }
    
    var to_i64: Int64 {
        return Int64(self)
    }
    
    var to_u: UInt {
        return UInt(self)
    }
    
    var to_u32: UInt32 {
        return UInt32(self)
    }
    
    var to_u64: UInt64 {
        return UInt64(self)
    }
    
    var to_bool: Bool {
        if self == 0 { return false }
        return true
    }
    
    /// Returns a string containing the character represented by the int's value according to encoding.
    ///
    ///     97.chr      #=> "a"
    ///     98.chr      #=> "b"
    ///
    var chr: String {
        return self.to_i.chr
    }
}

public extension Int64 {
    var to_f: Float {
        return Float(self)
    }
    
    var to_double: Double {
        return Double(self)
    }
    
    var to_i: Int {
        return Int(self)
    }
    
    var to_i32: Int32 {
        return Int32(self)
    }
    
    var to_i64: Int64 {
        return Int64(self)
    }
    
    var to_u: UInt {
        return UInt(self)
    }
    
    var to_u32: UInt32 {
        return UInt32(self)
    }
    
    var to_u64: UInt64 {
        return UInt64(self)
    }
    
    var to_bool: Bool {
        if self == 0 { return false }
        return true
    }
}

public extension Float {
    var to_f: Float {
        return Float(self)
    }
    
    var to_double: Double {
        return Double(self)
    }
    
    var to_i: Int {
        return Int(self)
    }
    
    var to_i32: Int32 {
        return Int32(self)
    }
    
    var to_i64: Int64 {
        return Int64(self)
    }
    
    var to_u: UInt {
        return UInt(self)
    }
    
    var to_u32: UInt32 {
        return UInt32(self)
    }
    
    var to_u64: UInt64 {
        return UInt64(self)
    }
    
    var to_bool: Bool {
        if self == 0.0 { return false }
        return true
    }
}

public extension Double {
    var to_f: Float {
        return Float(self)
    }
    
    var to_double: Double {
        return Double(self)
    }
    
    var to_i: Int {
        return Int(self)
    }
    
    var to_i32: Int32 {
        return Int32(self)
    }
    
    var to_i64: Int64 {
        return Int64(self)
    }
    
    var to_u: UInt {
        return UInt(self)
    }
    
    var to_u32: UInt32 {
        return UInt32(self)
    }
    
    var to_u64: UInt64 {
        return UInt64(self)
    }
    
    var to_bool: Bool {
        if self == 0.0 { return false }
        return true
    }
}
