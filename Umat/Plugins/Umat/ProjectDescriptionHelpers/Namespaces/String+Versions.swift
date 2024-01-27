//
//  String+Versions.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import Foundation

import ProjectDescription

public extension String {
    static func appVersion() -> String {
        let version: String = "1.0.0"
        return version
    }
    
    static func appBuildVersion() -> String {
        let buildVersion: String = "1"
        return buildVersion
    }
    
    static func mainBundleID() -> String {
        return Project.Environment.bundlePrefix
    }
    
    static func appBundleID(name: String) -> String {
        return Project.Environment.bundlePrefix + "." + name
    }
}
