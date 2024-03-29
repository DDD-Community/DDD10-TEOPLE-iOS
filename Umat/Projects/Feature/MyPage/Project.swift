import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "MyPage",
    bundleId: .appBundleID(name: ".MyPage"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
        .shared(implements: .entity),
        .shared(implements: .designSystem),
        .SwiftPackageManager.kingfisher
        // 관련된 코어도 추후 의존하게 구성
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
