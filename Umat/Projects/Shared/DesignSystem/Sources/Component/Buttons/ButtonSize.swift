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
            return .semiBold18
        case .medium:
            return .semiBold16
        case .small:
            return .semiBold14
        case .xsmall:
            return .semiBold12
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

    var height: CGFloat {
        switch self {
        case .large:
            return 54
        case .medium:
            return 50
        case .small:
            return 40
        case .xsmall:
            return 26
        }
    }
}
