# CollectionSplitting
![](https://img.shields.io/badge/platforms-iOS%2010%20%7C%20tvOS%2010%20%7C%20watchOS%204%20%7C%20macOS%2010.14-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/CollectionSplitting)
![GitHub](https://img.shields.io/github/license/wltrup/CollectionSplitting)

## What

**CollectionSplitting** is a Swift Package Manager package for iOS/tvOS (10.0 and above), watchOS (4.0 and above), and macOS (10.14 and above), under Swift 5.0 and above, adding an extension to `Collection` in order to define a function that splits the collection into an array of sub-sequences of equal length. 

```swift
public extension Collection {
    
    /// Splits self into an array of sub-sequences of self, each of count `maxSize`,
    /// except possibly for the last sub-sequence, which may be shorter.
    ///
    func split(maxSize size: Int) -> [SubSequence]
    
}
```

## Installation

**CollectionSplitting** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## License

**CollectionSplitting** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
