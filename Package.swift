// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionSplitting",
    products: [
        .library(
            name: "CollectionSplitting",
            targets: ["CollectionSplitting"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CollectionSplitting",
            dependencies: []),
        .testTarget(
            name: "CollectionSplittingTests",
            dependencies: ["CollectionSplitting"]),
    ]
)
