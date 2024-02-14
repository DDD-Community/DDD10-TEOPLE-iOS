import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Authorization",
    bundleId: .appBundleID(name: ".Authorization"),
    product: .staticFramework,
    packages: [.SwiftPackageManager.popupView],
    settings:  .settings(),
    dependencies: [
        .shared(implements: .designSystem),
        .shared(implements: .entity),
        .Package.popupView
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
