import Foundation

import ProjectDescription

let demoAppName: Template.Attribute = .required("name")
let demoAppPlatform: Template.Attribute = .optional("platform", default: "ios")

let template = Template(
    description: "New Demo App module template",
    attributes: [
        demoAppName,
        demoAppPlatform
    ],
    items: demoAppTemplate.allCases.map { $0.item }
)

enum demoAppTemplate: CaseIterable {
    case app
    case contentView
    case project
    case launchScreen
    case testTarget
    
    var item: Template.Item {
        switch self {
        case .app:
            return .file(path: .demoAppBasePath + "/Sources/\(demoAppName)App.swift", templatePath: "App.stencil")
        case .contentView:
            return .file(path: .demoAppBasePath + "/Sources/ContentView.swift", templatePath: "ContentView.stencil")
        case .project:
            return .file(path: .demoAppBasePath + "/Project.swift", templatePath: "Project.stencil")
        case .launchScreen:
            return .file(path: .demoAppBasePath + "/Resources/LaunchScreen.storyboard", templatePath: "LaunchScreen.storyboard")
        case .testTarget:
            return .file(path: .demoAppTestPath + "/Sources/\(demoAppName)Tests.swift", templatePath: "Test.stencil")
        }
    }
}

extension String {
    static var demoAppBasePath: Self {
        return "Projects/DemoApp/\(demoAppName)"
    }
    
    static var demoAppTestPath: Self {
        return "Projects/DemoApp/\(demoAppName)/\(demoAppName)Tests"
    }
}
