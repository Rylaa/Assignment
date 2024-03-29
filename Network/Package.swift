// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    dependencies: [
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: ["Core"]),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"]),
    ]
)
