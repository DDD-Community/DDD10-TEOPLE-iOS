//
//  FilterType.swift
//  DesignSystem
//
//  Created by 지준용 on 2/10/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

// TODO: 네트워크 모델을 사용해야 하는 View입니다. 추후 삭제 예정이며, 임시로 String값을 주었습니다.
public enum FilterType: String, CaseIterable {
    case both = "우리"
    case me = "나의"
    case you = "너의"
    
    var color: Color {
        switch self {
        case .both:
            return .colors(.both)
        case .me:
            return .colors(.me)
        case .you:
            return .colors(.you)
        }
    }
}
