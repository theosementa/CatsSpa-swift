// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Home", targets: ["Home"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models"),
        .package(name: "Providers", path: "../Providers")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "Providers", package: "Providers")
            ]
        )
    ]
)
