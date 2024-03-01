//
//  LoginMethod.swift
//  Authorization
//
//  Created by 지준용 on 2/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import Entity


extension LoginMethod {
    var icon: Icons? {
        switch self {
        case .kakao:
            return .kakao
        case .apple:
            return .apple
        }
    }
    
    var text: String {
        switch self {
        case .kakao:
            return "카카오로 로그인하기"
        case .apple:
            return "Apple로 로그인하기"
        }
    }
    
    var foregroundStyle: Color {
        switch self {
        case .kakao:
            return .init(hex: "#262626")
        case .apple:
            return .white
        }
    }
    
    var background: Color {
        switch self {
        case .kakao:
            return .init(hex: "#FEE500")
        case .apple:
            return .colors(.gray950)
        }
    }
}
