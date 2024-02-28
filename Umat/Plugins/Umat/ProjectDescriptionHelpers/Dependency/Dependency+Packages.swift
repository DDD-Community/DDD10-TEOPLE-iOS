import ProjectDescription

public extension TargetDependency {
    // dependency 파라미터에 들어갈 값입니다.
    enum XCFramework { }
    enum SwiftPackageManager { }
}

/// 로컬에 미리 확보해 둔 라이브러리 파일들의 경로입니다.
public extension TargetDependency.XCFramework {
    static let naverMaps = TargetDependency.xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsMap.xcframework"))
    static let naverGeometry = TargetDependency.xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsGeometry.xcframework"))
}

/// Swift Package Manager에서 fetch해 올 라이브러리의 목록입니다.
public extension TargetDependency.SwiftPackageManager {
    static let moya = TargetDependency.external(name: "Moya")
    static let combineMoya = TargetDependency.external(name: "CombineMoya")
    static let kingfisher = TargetDependency.external(name: "Kingfisher")
    static let popupView = TargetDependency.external(name: "PopupView")
}
