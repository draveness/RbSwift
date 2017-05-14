//: Playground - noun: a place where people can play

import UIKit
import RbSwift

let count = [1, 2, 3, nil, nil, 4, 5, 6, 7]
    .flatten()
    .select { $0 > 2 }
    .reject { $0.isEven }
    .count
count

"hello".gsub("l", "abc")
"hello".gsub("l", "lll")

if "hello world" =~ "hello" {
    print("this will match")
}

Date.now + 1.day
2.years + 1.day > 1.year

let str = "string"
"string".bridge
"string".bridge.bridge
