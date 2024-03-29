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
        .feature(implements: .markPlace),
        .feature(implements: .searchPlace),
        .core(implements: .maps),
        .shared(implements: .designSystem),
        .SwiftPackageManager.moya,
        .SwiftPackageManager.popupView
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**", "../../Support/Keys.plist"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
