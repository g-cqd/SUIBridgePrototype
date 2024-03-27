// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SUIBridgePrototype",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SUIBridgePrototype",
            targets: ["SUIBridgePrototype"]),
    ],
    targets: [
        .target(
            name: "SUIBridgePrototype"),
        .testTarget(
            name: "SUIBridgePrototypeTests",
            dependencies: ["SUIBridgePrototype"]),
    ]
)
