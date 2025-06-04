// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "network_connectivity_bridge",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "network_connectivity_bridge",
            targets: ["network_connectivity_bridge"]),
    ],
    dependencies: [
        .package(url: "https://github.com/flutter/flutter.git", from: "1.0.0"),
        .package(url: "https://github.com/fluttercommunity/connectivity_plus.git", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "network_connectivity_bridge",
            dependencies: [
                .product(name: "FlutterMacOS", package: "flutter"),
                .product(name: "connectivity_plus_macos", package: "connectivity_plus"),
            ],
            path: "Classes"
        ),
    ]
) 