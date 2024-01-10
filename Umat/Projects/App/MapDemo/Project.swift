import Foundation

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "MapDemo",
    bundleId: .appBundleID(name: "MapDemo"),
    product: .app,
    settings:  .settings(),
    dependencies: [
        .xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsMap.xcframework")),
        .xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsGeometry.xcframework"))
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
