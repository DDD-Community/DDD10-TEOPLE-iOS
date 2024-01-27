//
//  Path+Modules.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static var app: Self {
        return .relativeToRoot("Projects/\(ModulePath.App.name)")
    }
    
    static func demoApp(implementation module: ModulePath.App) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.DemoApp.name)/\(module.rawValue)")
    }
    
    static var feature: Self {
        return .relativeToRoot("Projects/\(ModulePath.Features.name)")
    }
    
    static func feature(implementation module: ModulePath.Features) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Features.name)/\(module.rawValue)")
    }
    
    static var core: Self {
        return .relativeToRoot("Projects/\(ModulePath.Cores.name)")
    }
    
    static func core(implementation module: ModulePath.Cores) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Cores.name)/\(module.rawValue)")
    }
    
    static var shared: Self {
        return .relativeToRoot("Projects/\(ModulePath.Shared.name)")
    }
    
    static func shared(implementation module: ModulePath.Shared) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Shared .name)/\(module.rawValue)")
    }
}
