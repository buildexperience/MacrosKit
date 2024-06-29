// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MacrosKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MacrosKit",
            targets: [
                "MacrosKit"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.0")
    ],
    targets: [
        .target(
            name: "MacrosKit",
            dependencies: [
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "MacrosKitTests",
            dependencies: [
                "MacrosKit"
            ]
        ),
    ]
)
