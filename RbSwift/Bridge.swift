//
//  Bridge.swift
//  RbSwift
//
//  Created by draveness on 17/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension NSString {
    var bridge: String {
        return self as String
    }
}

public extension String {
    var bridge: NSString {
        return self as NSString
    }
}

public extension NSData {
    var bridge: Data {
        return self as Data
    }
}

public extension Data {
    var bridge: NSData {
        return self as NSData
    }
}

public extension NSURL {
    var bridge: URL {
        return self as URL
    }
}

public extension URL {
    var bridge: NSURL {
        return self as NSURL
    }
}

public extension NSIndexPath {
    var bridge: IndexPath {
        return self as IndexPath
    }
}

public extension IndexPath {
    var bridge: NSIndexPath {
        return self as NSIndexPath
    }
}
