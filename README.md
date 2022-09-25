# LicenseListPlugin
A Swift Package Plugin for [LicenseList](https://github.com/cybozu/LicenseList.git) that will run SwiftPackagesParser (spp) on build time in Xcode.

## Usage

1. Create `license-list.plist` at the `YOUR_TARGET` directory.
   ```shell
   $ cd [your target directory path]
   $ echo '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><dict></dict></plist>' > license-list.plist
   ```
2. Add a dependency from this package:
   ```swift
   dependencies: [
       .package(url: "https://github.com/cybozu/LicenseListPlugin.git", exact: "0.1.6")
   ]
   ```
3. Then add it to your targets as a plugin:
   ```swift
   targets: [
       .target(
           name: "YOUR_TARGET",
           resources: [
               .process("license-list.plist")
           ],
           plugins: [
               .plugin(name: "SwiftPackagesParser", package: "LicenseListPlugin")
           ]
       ),
   ]
   ```
