import Foundation

import ProjectDescription

let moduleName: Template.Attribute = .required("name")
let modulePlatform: Template.Attribute = .optional("platform", default: "ios")

let template = Template(
    description: "New Module Template",
    attributes: [
        moduleName,
        modulePlatform
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
            return .file(path: .moduleBasePath + "/Project.swift", templatePath: "Project.stencil")
        case .baseFile:
            return .file(path: .moduleBasePath + "/Sources/BaseObject.swift", templatePath: "BaseObject.stencil")
        case .testTarget:
            return .file(path: .moduleTestPath + "/Sources/\(moduleName)Tests.swift", templatePath: "Test.stencil")
        }
    }
}

extension String {
    static var moduleBasePath: Self {
        return "Projects/Feature/\(moduleName)"
    }
    
    static var moduleTestPath: Self {
        return "Projects/Feature/\(moduleName)/\(moduleName)Tests"
    }
}
