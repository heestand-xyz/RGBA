// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "RGBA",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "RGBA",
            targets: ["RGBA"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax",
            from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"
        ),
        .package(
            url: "https://github.com/apple/swift-collections",
            from: "1.0.0"
        ),
    ],
    targets: [
        .target(
            name: "RGBA",
            dependencies: [
                "RGBAMacros",
                .product(name: "Collections", package: "swift-collections"),
            ]),
        .testTarget(
            name: "RGBATests",
            dependencies: [
                "RGBA",
                .product(name: "SwiftSyntaxMacrosTestSupport",
                         package: "swift-syntax"),
            ]),
        .macro(
            name: "RGBAMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros",
                         package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin",
                         package: "swift-syntax"),
            ]),
    ]
)
