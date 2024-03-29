// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Sheeeeeeeeet",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Sheeeeeeeeet",
            targets: ["Sheeeeeeeeet"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/danielsaidi/MockingKit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Sheeeeeeeeet",
            dependencies: []),
        .testTarget(
            name: "SheeeeeeeeetTests",
            dependencies: ["Sheeeeeeeeet", "Quick", "Nimble", "MockingKit"])
    ]
)
