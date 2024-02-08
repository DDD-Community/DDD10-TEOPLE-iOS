//
//  ButtonState.swift
//  DesignSystem
//
//  Created by 지준용 on 2/9/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public enum ButtonState {
    case enabled
    case disabled
    case selected
    case unselected
    
    var background: Color {
        switch self {
        case .enabled:
            return .colors(.gray800)
        case .disabled:
            return .colors(.gray300)
        case .selected:
            return .colors(.gray50)
        case .unselectd:
            return .white
        }
    }
    
    var foregroundStyle: Color {
        switch self {
        case .enabled, .disabled:
            return .white
        case .selected, .unselectd:
            return .colors(.gray800)
        }
    }
    
    var stroke: Color {
        switch self {
        case .enabled:
            return .colors(.gray800)
        case .disabled:
            return .colors(.gray300)
        case .selected:
            return .colors(.gray500)
        case .unselectd:
            return .colors(.gray300)
        }
    }
}
