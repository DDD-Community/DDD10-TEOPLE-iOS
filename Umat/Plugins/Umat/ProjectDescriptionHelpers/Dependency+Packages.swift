//
//  Dependency+Packages.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import ProjectDescription

public extension Package {
    // 사용하는 외부 패키지 의존성을 여기서 관리할 수 있습니다.
    enum SwiftPackageManager { }
}

public extension Package.SwiftPackageManager {
    // 사용하고자 하는 패키지가 추가될 때마다 아래 형식을 따라 추가하면 됩니다.
    static let kingfisher = Package.remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "7.10.2"))
}

public extension TargetDependency {
    // dependency 파라미터에 들어갈 값입니다.
    // package 파라미터와 dependency 파라미터 양쪽에 모두 사용할 패키지를 명시해주어야 합니다.
    enum Package { }
    enum XCFramework { }
}

public extension TargetDependency.Package {
    // 사용하고자 하는 패키지가 추가될 때마다 아래 형식을 따라 추가하면 됩니다.
    static let kingfisher = TargetDependency.package(product: "Kingfisher")
}

public extension TargetDependency.XCFramework {
    static let naverMaps = TargetDependency.xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsMap.xcframework"))
    static let naverGeometry = TargetDependency.xcframework(path: .relativeToRoot("Projects/Support/NaverMapsFrameworks/NMapsGeometry.xcframework"))
}
