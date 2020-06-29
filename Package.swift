// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sheeeeeeeeet",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Sheeeeeeeeet",
            targets: ["Sheeeeeeeeet"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "3.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
        .package(url: "https://github.com/danielsaidi/Mockery.git", from: "0.3.3"),
    ],
    targets: [
        .target(
            name: "Sheeeeeeeeet",
            dependencies: []),
        .testTarget(
            name: "SheeeeeeeeetTests",
            dependencies: ["Sheeeeeeeeet", "Quick", "Nimble", "Mockery"])
    ]
)
