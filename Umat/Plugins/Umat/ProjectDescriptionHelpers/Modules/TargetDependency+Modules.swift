//
//  TargetDependency+Modules.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import ProjectDescription

public extension TargetDependency {
    static var app: Self {
        return .project(target: ModulePath.App.name, path: .app)
    }
    
    static func app(implements module: ModulePath.App) -> Self {
        return .project(name: ModulePath.App.name + module.rawValue)
    }
    
    static func feature(implements module: ModulePath.Features) -> Self {
        return .project(target: module.rawValue, path: .feature(implementation: module))
    }
    
    static func core(implements module: ModulePath.Cores) -> Self {
        return .project(target: module.rawValue, path: .core(implementation: module))
    }
    
    static func shared(implements module: ModulePath.Shared) -> Self {
        return .project(target: module.rawValue, path: .shared(implementation: module))
    }
}
