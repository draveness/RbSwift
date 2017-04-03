![](./RbSwift.jpg)

<p align="center">
<a href="https://travis-ci.org/Draveness/RbSwift"><img src="https://travis-ci.org/Draveness/RbSwift.svg?branch=master"></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-ready-orange.svg"></a>
<a href="http://cocoadocs.org/docsets/RbSwift"><img src="https://img.shields.io/cocoapods/v/RbSwift.svg?style=flat"></a>
<a href="https://raw.githubusercontent.com/draveness/RbSwift/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/RbSwift.svg?style=flat"></a>
<a href="http://cocoadocs.org/docsets/RbSwift"><img src="https://img.shields.io/cocoapods/p/RbSwift.svg?style=flat"></a>
</p>

RbSwift provides a series of Swift struct/class extension including lots of handy functions with elaborate [Documents](http://cocoadocs.org/docsets/RbSwift/0.1.4/index.html).

## Features

+ [x] Transform functions support for `Sequence` and `Array`

    ```swift
    [1, 2, 3, nil, nil, 4, 5, 6, 7]
        .flatten()              #=> [1, 2, 3, 4, 5, 6, 7]
        .select { $0 > 2 }      #=> [3, 4, 5, 6, 7]      
        .reject { $0.isEven }   #=> [3, 5, 7]
        .count                  #=> 3
    ```

+ [x] Built-in `Regex` support for `String` 

    ```swift
    "hello".gsub("l", "abc")    #=> "heabcabco"
    "hello".gsub("l", "lll")    #=> "lllllllllllllll"

    if "hello world" =~ "hello" {
        print("this will match")
    }
    ```

+ [x] Convenient methods build `Date` instance

    ```
    Date.now + 1.day            #=> 2017-01-01 12:00:00 +0000
    2.years + 1.day > 1.year    #=> true
    ```

## Usage

<p align="center">
    <a href="#number">Number</a> • <a href="#string">String</a> • <a href="#array">Array</a> • <a href="#data">Date</a> • <a href="#regex">Regex</a> • <a href="#hash">Hash</a>
</p>

### Number

### String

### Array

### Date

### Regex

### Hash

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate RbSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'RbSwift', '~> 0.1.3'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate RbSwift into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Draveness/RbSwift" ~> 0.1.3
```

Run `carthage update` to build the framework and drag the built `RbSwift.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but RbSwift does support its use on supported platforms. 

Once you have your Swift package set up, adding RbSwift as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .Package(url: "https://github.com/Draveness/RbSwift.git", majorVersion: 0)
]
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate RbSwift into your project manually.

### Contact

Follow and contact me with [email](mailto:i@draveness.me). If you find an issue, just [open a ticket](https://github.com/draveness/rbswift/issues/new). Pull requests are warmly welcome as well.

### License

RbSwift is released under the MIT license. See LICENSE for details.


