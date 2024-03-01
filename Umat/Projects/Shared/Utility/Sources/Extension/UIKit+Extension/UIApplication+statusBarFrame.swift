//
//  UIApplication+statusBarFrame.swift
//  Utility
//
//  Created by 지준용 on 2/25/24.
//

import SwiftUI
import UIKit

fileprivate extension UIApplication {
    var scene: UIWindowScene? {
        UIApplication
            .shared
            .connectedScenes
            .first as? UIWindowScene
    }
    
    var window: UIWindow? {
        if let scene = scene {
            return UIWindow(windowScene: scene)
        }
        
        return nil
    }
    
    private var statusBarManager: UIStatusBarManager? {
        return scene?.statusBarManager
    }
    
    var statusBarFrame: CGRect? {
        return statusBarManager?.statusBarFrame
    }
    
    var statusBarHeight: CGFloat? {
        return statusBarFrame?.height
    }
}

public extension View {
    var window: UIWindow? {
        if let window = UIApplication.shared.window {
            return window
        }
        return nil
    }
}

public extension View {
    var statusBarHeight: CGFloat {
        if let height = UIApplication.shared.statusBarHeight {
            return height
        }
        return 0
    }
}
