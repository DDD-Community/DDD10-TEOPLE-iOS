import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

/// 전체 모듈을 import하여 실험할 수 있는 UmaiDemo 앱입니다.
/// 시험해보고자 하는 피처들에 의존하게 하여 빌드할 수 있습니다.
/// signing 설정은 별도로 하지 않아서, Automatic으로 한 다음 빌드하시면 됩니다.
let project = Project.makeAppModule(
    name: "UmaiDemo",
    bundleId: .appBundleID(name: "UmaiDemo"),
    product: .app,
    settings: .settings(),
    dependencies: [
        .XCFramework.naverMaps,
        .XCFramework.naverGeometry,
        .feature(implements: .myPage)
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
