import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Utility",
    bundleId: .appBundleID(name: ".Utility"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
        .sdk(name: "OSLog", type: .framework)
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
