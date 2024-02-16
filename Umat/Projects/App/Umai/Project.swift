import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Umai",
    bundleId: .mainBundleID(),
    product: .app,
    packages: [.SwiftPackageManager.popupView],
    settings: .appMainSettings,
    dependencies: [
        .feature(implements: .authorization),
        .shared(implements: .designSystem),
        .Package.popupView
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
