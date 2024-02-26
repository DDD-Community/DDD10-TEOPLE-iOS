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
    var statusBarHeight: CGFloat {
        if let height = UIApplication.shared.statusBarHeight {
            return height
        }
        return 0
    }
}
