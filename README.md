![](./RbSwift.jpg)

<p align="center">
<a href="https://travis-ci.org/draveness/RbSwift"><img src="https://img.shields.io/travis/draveness/RbSwift/master.svg"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-ready-orange.svg"></a>
<a href="http://cocoadocs.org/docsets/RbSwift"><img src="https://img.shields.io/cocoapods/v/RbSwift.svg?style=flat"></a>
<a href="https://raw.githubusercontent.com/draveness/RbSwift/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/RbSwift.svg?style=flat"></a>
<a href="http://cocoadocs.org/docsets/RbSwift"><img src="https://img.shields.io/cocoapods/p/RbSwift.svg?style=flat"></a>
</p>

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


