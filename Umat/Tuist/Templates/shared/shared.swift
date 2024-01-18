import Foundation

import ProjectDescription

let sharedName: Template.Attribute = .required("name")
let sharedPlatform: Template.Attribute = .optional("platform", default: "ios")

let template = Template(
    description: "New Shared Module Template",
    attributes: [
        sharedName,
        sharedPlatform
    ],
    items: ModuleTemplate.allCases.map { $0.item }
)

enum ModuleTemplate: CaseIterable {
    case project
    case baseFile
    case testTarget
    
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: .sharedBasePath + "/Project.swift", templatePath: "Project.stencil")
        case .baseFile:
            return .file(path: .sharedBasePath + "/Sources/BaseObject.swift", templatePath: "BaseObject.stencil")
        case .testTarget:
            return .file(path: .sharedTestPath + "/Sources/\(sharedName)Tests.swift", templatePath: "Test.stencil")
        }
    }
}

extension String {
    static var sharedBasePath: Self {
        return "Projects/Shared/\(sharedName)"
    }
    
    static var sharedTestPath: Self {
        return "Projects/Shared/\(sharedName)/\(sharedName)Tests"
    }
}
