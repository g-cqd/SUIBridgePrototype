// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SUIBridgedView",
    platforms: [.iOS(.v17),.macOS(.v14)],
    products: [
        .library(
            name: "SUIBridgedView",
            targets: ["SUIBridgedView"]),
    ],
    targets: [
        .target(
            name: "SUIBridgedView"),
        .testTarget(
            name: "SUIBridgedViewTests",
            dependencies: ["SUIBridgedView"]),
    ]
)
