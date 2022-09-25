// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "LicenseListPlugin",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .plugin(
            name: "SwiftPackagesParser",
            targets: ["SwiftPackagesParser"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "swift-packages-parser",
            url: "https://github.com/cybozu/LicenseList/releases/download/0.1.6/swift-packages-parser-macos.artifactbundle.zip",
            checksum: "29591d5ec6f02462e9248a69de7b30efccaa6ce0a7bce2c4aecabe68a20f3113"
        ),
        .plugin(
            name: "SwiftPackagesParser",
            capability: .buildTool(),
            dependencies: [
                .target(name: "swift-packages-parser")
            ]
        )
    ]
)
