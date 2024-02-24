import ProjectDescription

/// 사용하고자 하는 Carthage 지원 라이브러리 목록 프로퍼티입니다.
let carthageDependencies = CarthageDependencies(
    [
        
    ]
)

/// 사용하고자 하는 Swift Package Manager 지원 라이브러리 목록 프로퍼티입니다.
let swiftPackageManagerDependencies = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "7.10.2")),
        .remote(url: "https://github.com/exyte/PopupView", requirement: .upToNextMajor(from: "2.8.5"))
    ]
)

let dependencies = Dependencies(
    carthage: carthageDependencies,
    swiftPackageManager: swiftPackageManagerDependencies,
    platforms: [.iOS]
)
