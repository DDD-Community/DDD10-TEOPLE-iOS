import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "MapDemo",
    bundleId: .appBundleID(name: "MapDemo"),
    product: .app,
    settings: .settings(),
    dependencies: [
        .XCFramework.naverMaps,
        .XCFramework.naverGeometry
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
