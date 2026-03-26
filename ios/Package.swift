// swift-tools-version: 6.0
// Optional SwiftPM stub — replace with your real package graph or remove if using only Xcode projects.
import PackageDescription

let package = Package(
    name: "AppStudkioPlaceholder",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "AppStudkioPlaceholder", targets: ["AppStudkioPlaceholder"])
    ],
    targets: [
        .target(
            name: "AppStudkioPlaceholder",
            path: "Sources/AppStudkioPlaceholder"
        ),
        .testTarget(
            name: "AppStudkioPlaceholderTests",
            dependencies: ["AppStudkioPlaceholder"],
            path: "Tests/AppStudkioPlaceholderTests"
        )
    ]
)
