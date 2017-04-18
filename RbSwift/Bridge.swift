//
//  Bridgeswift
//  RbSwift
//
//  Created by draveness on 17/04/2017
//  Copyright © 2017 draveness All rights reserved
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


public extension NSError {
    var bridge: Error {
        return self as Error
    }
}

public extension Error {
    var bridge: NSError {
        return self as NSError
    }
}

public extension NSIndexSet {
    var bridge: IndexSet {
        return self as IndexSet
    }
}

public extension IndexSet {
    var bridge: NSIndexSet {
        return self as NSIndexSet
    }
}

public extension NSCalendar {
    var bridge: Calendar {
        return self as Calendar
    }
}

public extension Calendar {
    var bridge: NSCalendar {
        return self as NSCalendar
    }
}

public extension NSTimeZone {
    var bridge: TimeZone {
        return self as TimeZone
    }
}

public extension TimeZone {
    var bridge: NSTimeZone {
        return self as NSTimeZone
    }
}

public extension NSDate {
    var bridge: Date {
        return self as Date
    }
}

public extension Date {
    var bridge: NSDate {
        return self as NSDate
    }
}

public extension NSURLRequest {
    var bridge: URLRequest {
        return self as URLRequest
    }
}

public extension URLRequest {
    var bridge: NSURLRequest {
        return self as NSURLRequest
    }
}

public extension NSURLComponents {
    var bridge: URLComponents {
        return self as URLComponents
    }
}

public extension URLComponents {
    var bridge: NSURLComponents {
        return self as NSURLComponents
    }
}
