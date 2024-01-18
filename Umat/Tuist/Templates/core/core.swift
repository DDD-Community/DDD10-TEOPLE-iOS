import Foundation

import ProjectDescription

let coreName: Template.Attribute = .required("name")
let corePlatform: Template.Attribute = .optional("platform", default: "ios")

let template = Template(
    description: "New Core Module Template",
    attributes: [
        coreName,
        corePlatform
    ],
    items: CoreTemplate.allCases.map { $0.item }
)

enum CoreTemplate: CaseIterable {
    case project
    case baseFile
    case testTarget
    
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: .coreBasePath + "/Project.swift", templatePath: "Project.stencil")
        case .baseFile:
            return .file(path: .coreBasePath + "/Sources/BaseObject.swift", templatePath: "BaseObject.stencil")
        case .testTarget:
            return .file(path: .coreTestPath + "/Sources/\(coreName)Tests.swift", templatePath: "Test.stencil")
        }
    }
}

extension String {
    static var coreBasePath: Self {
        return "Projects/Core/\(coreName)"
    }
    
    static var coreTestPath: Self {
        return "Projects/Core/\(coreName)/\(coreName)Tests"
    }
}
