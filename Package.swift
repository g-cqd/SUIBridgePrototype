// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SUIBridge",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SUIBridge",
            targets: ["SUIBridge"]),
    ],
    targets: [
        .target(
            name: "SUIBridge"),
        .testTarget(
            name: "SUIBridgedViewTests",
            dependencies: ["SUIBridge"]),
    ]
)
