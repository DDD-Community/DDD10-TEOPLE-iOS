import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Networking",
    bundleId: .appBundleID(name: ".Networking"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
