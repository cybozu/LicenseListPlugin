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
            checksum: "ee54a64cdf3951b786617ea304d51438782d5d98c085abd01d0a75bb8ca578bb"
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
