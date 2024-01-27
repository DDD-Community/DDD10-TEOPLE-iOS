import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "HelloDemo",
    bundleId: .appBundleID(name: "HelloDemo"),
    product: .app,
    settings: .settings(),
    dependencies: [
        .feature(implements: .helloFeature)
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
