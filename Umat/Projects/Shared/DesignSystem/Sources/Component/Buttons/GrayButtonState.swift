//
//  ButtonState.swift
//  DesignSystem
//
//  Created by 지준용 on 2/9/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public enum GrayButtonState {
    case enabled
    case disabled
    case selected
    case unselected
    
    // MARK: - Background Colors
    var background: Color {
        switch self {
        case .enabled:
            return .colors(.gray800)
        case .disabled:
            return .colors(.gray300)
        case .selected:
            return .colors(.gray50)
        case .unselected:
            return .white
        }
    }
    
    // MARK: - Foreground Colors
    var foregroundStyle: Color {
        switch self {
        case .enabled, .disabled:
            return .white
        case .selected, .unselected:
            return .colors(.gray800)
        }
    }
    
    // MARK: - StrokeColors
    var stroke: Color {
        switch self {
        case .enabled:
            return .colors(.gray800)
        case .disabled:
            return .colors(.gray300)
        case .selected:
            return .colors(.gray500)
        case .unselected:
            return .colors(.gray300)
        }
    }
}
