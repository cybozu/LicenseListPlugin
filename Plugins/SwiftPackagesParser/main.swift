import Foundation
import PackagePlugin

@main
struct LicenseListPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let pluginWorkDirectory = context.pluginWorkDirectory.string
        let regex = try NSRegularExpression(pattern: ".*SourcePackages")
        let range = NSMakeRange(0, pluginWorkDirectory.utf16.count)
        guard let result = regex.firstMatch(in: pluginWorkDirectory, range: range) else {
            throw NSError(
                domain: "com.cybozu.LicenseListPlugin",
                code: 1,
                userInfo: ["message": "Failed to match"]
            )
        }
        let sourcePackageDirectory = NSString(string: pluginWorkDirectory)
            .substring(with: result.range(at: 0))
        return [
            .prebuildCommand(
                displayName: "LicenseList",
                executable: try context.tool(named: "spp").path,
                arguments: [
                    target.directory.string,
                    sourcePackageDirectory
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}
