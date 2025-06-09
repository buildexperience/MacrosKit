// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MacrosKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13),
        .visionOS(.v1),
        .macCatalyst(.v13)
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
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            from: "601.0.0"
        ),
    ],
    targets: [
        .target(
            name: "MacrosKit",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            ]
        )
    ]
)
