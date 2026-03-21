// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Home", targets: ["Home"]),
        .library(name: "Analytics", targets: ["Analytics"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models"),
        .package(name: "Providers", path: "../Providers"),
        .package(name: "Navigation", path: "../Navigation"),
        .package(name: "DesignSystem", path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "Analytics",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "Providers", package: "Providers"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "DesignSystem", package: "DesignSystem")
            ]
        ),
        .target(
            name: "Home",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "Providers", package: "Providers"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .target(name: "Analytics")
            ]
        )
    ]
)
