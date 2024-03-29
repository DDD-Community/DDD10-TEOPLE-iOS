import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Maps",
    bundleId: .appBundleID(name: ".Maps"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
        .shared(implements: .designSystem),
        .shared(implements: .entity),
        .shared(implements: .utility),
        .XCFramework.naverMaps,
        .XCFramework.naverGeometry
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
