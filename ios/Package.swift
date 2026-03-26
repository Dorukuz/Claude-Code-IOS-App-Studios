// swift-tools-version: 6.0
// Optional SwiftPM stub — replace with your real package graph or remove if using only Xcode projects.
// Repo: Claude-Code-IOS-App-Studios (Swift module name cannot contain hyphens.)
import PackageDescription

let package = Package(
    name: "ClaudeCodeIOSAppStudios",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "ClaudeCodeIOSAppStudios", targets: ["ClaudeCodeIOSAppStudios"])
    ],
    targets: [
        .target(
            name: "ClaudeCodeIOSAppStudios",
            path: "Sources/ClaudeCodeIOSAppStudios"
        ),
        .testTarget(
            name: "ClaudeCodeIOSAppStudiosTests",
            dependencies: ["ClaudeCodeIOSAppStudios"],
            path: "Tests/ClaudeCodeIOSAppStudiosTests"
        )
    ]
)
