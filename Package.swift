// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AnimatedGradient",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "AnimatedGradient", targets: ["AnimatedGradient"]),
    ],
    targets: [
        .target(name: "AnimatedGradient"),
    ]
)
