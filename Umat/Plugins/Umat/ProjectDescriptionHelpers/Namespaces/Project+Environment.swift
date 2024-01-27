//
//  Project+Environment.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import ProjectDescription

public extension Project {
    enum Environment {
        public static let appName = "Umai"
//        public static let appDemoName = "Umai-Demo"
//        public static let devName = "Umai-Dev"
        public static let organizationName = "KYUNG MIN CHOI"
        public static let organizationTeamId = "H5UNW2D34P" // 팀 아이디 보고 변경
        public static let deploymentTarget = DeploymentTarget.iOS(targetVersion: "17.0", devices: [.iphone, .ipad]) // 타겟은 보고 변경
        public static let bundlePrefix = "com.teople.umai"
        public static let appVersion = "1.0.0"
        public static let mainBundleId = "com.umai"
    }
}
