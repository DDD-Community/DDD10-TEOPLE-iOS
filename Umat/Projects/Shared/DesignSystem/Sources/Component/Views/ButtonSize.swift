//
//  ButtonSize.swift
//  DesignSystem
//
//  Created by 지준용 on 2/9/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public enum ButtonSize {
    case large
    case medium // default
    case small
    case xsmall
    
    // MARK: - Font Size
    var font: Fonts.PretendardFonts {
        switch self {
        case .large:
            return .ps18
        case .medium:
            return .ps16
        case .small:
            return .ps14
        case .xsmall:
            return .ps12
        }
    }
    
    // MARK: - Icon Size
    var icon: CGFloat {
        switch self {
        case .large:
            return 24
        case .medium:
            return 22
        case .small:
            return 20
        case .xsmall:
            return 12
        }
    }
    
    // MARK: - Insets
    var insets: EdgeInsets {
        switch self {
        case .large:
            return .init(top: 15, leading: 24, bottom: 15, trailing: 24)
        case .medium:
            return .init(top: 13, leading: 24, bottom: 13, trailing: 24)
        case .small:
            return .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        case .xsmall:
            return .init(top: 6, leading: 12, bottom: 6, trailing: 12)
        }
    }
}
