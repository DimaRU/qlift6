// swift-tools-version:5.6
import PackageDescription

var swiftSettings: [SwiftSetting]? = nil
if let buildFlag = try? getQTBuildFlag() {
    swiftSettings = [.define(buildFlag)]
}

let package = Package(
    name: "Qlift",
    products: [
        .library(name: "Qlift", targets: ["Qlift"]),
    ],
    targets: [
        .target(name: "Qlift",
                dependencies: ["CQlift"],
                swiftSettings: swiftSettings),
        .target(name: "CQlift",
                dependencies: ["CQt5Widgets", "CQt5Quick"],
                cxxSettings: [.headerSearchPath("private")]),
        .systemLibrary(name: "CQt5Widgets", pkgConfig: "Qt5Widgets"),
        .systemLibrary(name: "CQt5Quick", pkgConfig: "Qt5Quick"),
    ],
    cxxLanguageStandard: .cxx17
)

import Foundation

private func getURL(for app: String) -> URL? {
    let pathList = ProcessInfo.processInfo.environment["PATH"] ?? "/usr/bin"
    for path in pathList.split(separator: ":") {
        let url = URL(fileURLWithPath: String(path)).appendingPathComponent(app)
        if let res = try? url.resourceValues(forKeys: [.isExecutableKey]),
           res.isExecutable ?? false
        {
            return url
        }
    }
    return nil
}

private func runCmd(url: URL, command: String) throws -> (exitCode: Int32, output: String) {
    let process = Process()
    process.executableURL = url

    let stdinPipe = Pipe()
    let stdErrPipe = Pipe()
    process.standardOutput = stdinPipe
    process.standardError = stdErrPipe
    process.arguments = command.split(separator: " ").map { String($0) }
    try process.run()
    process.waitUntilExit()
    let status = process.terminationStatus

    let data = try stdinPipe.fileHandleForReading.readToEnd() ?? Data()
    let output = (String(data: data, encoding: .utf8) ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    return (exitCode: status, output: output)
}

private func getQTBuildFlag() throws -> String? {
    guard let url = getURL(for: "pkg-config") else { return nil }
    
    let (exitCode, version) = try runCmd(url: url, command: "--modversion Qt5Widgets")
    guard exitCode == 0, !version.isEmpty else { return nil }
    
    let compare = version.compare("5.15.0", options: .numeric)
    if compare == .orderedSame || compare == .orderedDescending {
        return "QT5_15"
    }
    return nil
}
