import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "HelloFeature",
    bundleId: .appBundleID(name: ".HelloFeature"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .core(implements: .networking)
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
