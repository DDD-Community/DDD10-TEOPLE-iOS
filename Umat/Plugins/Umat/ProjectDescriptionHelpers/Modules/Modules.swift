//
//  Modules.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import Foundation

public enum ModulePath {
    case demoApp(DemoApp)
    case feature(Features)
    case core(Cores)
    case shared(Shared)
}

public extension ModulePath {
    enum App: String, CaseIterable {
        case iOS
        case iPad
        
        public static let name = "App"
    }
    
    enum DemoApp: String, CaseIterable {
        case UmaiDemo = "UmaiDemo"
        
        public static let name = "DemoApp"
    }
    
    enum Features: String, CaseIterable {
        case authorization = "Authorization"
        case myPage = "MyPage"
        case markPlace = "MarkPlace"
        
        public static let name = "Feature"
    }
    
    enum Cores: String, CaseIterable {
        case networking = "Networking"
        case maps = "Maps"
        
        public static let name = "Core"
    }
    
    enum Shared: String, CaseIterable {
        case entity = "Entity"
        case designSystem = "DesignSystem"
        case utility = "Utility"
        
        public static let name = "Shared"
    }
}
