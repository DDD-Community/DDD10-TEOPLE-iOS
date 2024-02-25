import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "SearchPlace",
    bundleId: .appBundleID(name: ".SearchPlace"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
        .core(implements: .maps),
        .core(implements: .networking),
        .shared(implements: .designSystem),
        .shared(implements: .entity),
        .SwiftPackageManager.moya,
        .SwiftPackageManager.combineMoya,
        .SwiftPackageManager.kingfisher
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
