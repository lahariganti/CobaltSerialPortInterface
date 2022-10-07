// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CobaltSPI",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
        .package(url: "https://github.com/yeokm1/SwiftSerial.git", from: "0.1.2")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "CobaltSPI",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"),
                            .product(name: "SwiftSerial", package: "SwiftSerial")]),
        .testTarget(
            name: "CobaltSPITests",
            dependencies: ["CobaltSPI"]),
    ]
)
