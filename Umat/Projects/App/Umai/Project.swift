import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Umai",
    bundleId: .mainBundleID(),
    product: .app,
    settings: .appMainSettings,
    dependencies: [
        .feature(implements: .authorization),
        .feature(implements: .myPage),
        .core(implements: .maps),
        .shared(implements: .designSystem),
        .SwiftPackageManager.popupView
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
