import Foundation

import ProjectDescription

let featureName: Template.Attribute = .required("name")
let featurePlatform: Template.Attribute = .optional("platform", default: "ios")

let template = Template(
    description: "New Feature Module Template",
    attributes: [
        featureName,
        featurePlatform
    ],
    items: FeatureTemplate.allCases.map { $0.item }
)

enum FeatureTemplate: CaseIterable {
    case project
    case baseFile
    case testTarget
    
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: .featureBasePath + "/Project.swift", templatePath: "Project.stencil")
        case .baseFile:
            return .file(path: .featureBasePath + "/Sources/BaseObject.swift", templatePath: "BaseObject.stencil")
        case .testTarget:
            return .file(path: .featureTestPath + "/Sources/\(featureName)Tests.swift", templatePath: "Test.stencil")
        }
    }
}

extension String {
    static var featureBasePath: Self {
        return "Projects/Feature/\(featureName)"
    }
    
    static var featureTestPath: Self {
        return "Projects/Feature/\(featureName)/\(featureName)Tests"
    }
}
