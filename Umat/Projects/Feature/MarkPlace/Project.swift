//
//  Project.swift
//  Templates
//
//  Created by 지준용 on 2/21/24.
//

import Foundation

import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "MarkPlace",
    bundleId: .appBundleID(name: ".MarkPlace"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
        .shared(implements: .designSystem),
        .shared(implements: .entity),
        .shared(implements: .utility),
        .core(implements: .maps)
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: "../../Support/Info.plist")
)
