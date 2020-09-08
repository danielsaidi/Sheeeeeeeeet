// swift-tools-version:5.2

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
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.0")),
        .package(url: "https://github.com/danielsaidi/Mockery.git", .upToNextMajor(from: "0.6.0"))
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
