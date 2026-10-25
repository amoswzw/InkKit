// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "InkKit",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "InkKit", targets: ["InkKit"]),
    ],
    targets: [
        .target(name: "InkKit"),
        .testTarget(name: "InkKitTests", dependencies: ["InkKit"]),
    ]
)
