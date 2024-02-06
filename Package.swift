// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Specify the platform supported by the package.
#if os(macOS)
let supportedPlatform: SupportedPlatform = .macOS(.v13)
#elseif os(Linux)
let supportedPlatform: SupportedPlatform = .linux
#elseif os(Windows)
let supportedPlatform: SupportedPlatform = .windows
#endif

let package = Package(
    name: "Day2",
    platforms: [supportedPlatform],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "Day2",
            targets: ["Day2Executable"]),
        .library(
            name: "Day2KataLib",
            targets: ["Day2KataLib"]),
        // .library(
        //     name: "Day2Lib",
        //     targets: ["Day2Lib"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Day2Executable",
            dependencies: ["Day2KataLib"]),
        // .target(
        //     name: "Day2Lib"),
        // .testTarget(
        //     name: "Day2Tests",
        //     dependencies: ["Day2Lib"]),
        .target(
            name: "Day2KataLib"),
        .testTarget(
            name: "Day2KataTests",
            dependencies: ["Day2KataLib"]),
    ]
)

// Enable upcoming features for all targets
for target in package.targets {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(contentsOf: [
        .enableUpcomingFeature("BareSlashRegexLiterals"),
    ])
}
