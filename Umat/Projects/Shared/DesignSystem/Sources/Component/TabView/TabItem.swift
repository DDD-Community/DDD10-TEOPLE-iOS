//
//  TabItem.swift
//  DesignSystem
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public enum TabItem: CaseIterable {
    case left
    case center
    case right

    var image: Image {
        switch self {
        case .left: .icons(.ic_home_outlined)
        case .center: .init(systemName: "plus.app.fill")
        case .right: .icons(.ic_my_outlined)
        }
    }
    
    var text: String {
        switch self {
        case .left: "홈"
        case .center: ""
        case .right: "마이페이지"
        }
    }
    
    var selectedColor: Color {
        return .colors(.gray800)
    }
    
    var unsSelectedColor: Color {
        return .colors(.gray300)
    }
    
    var imageSize: CGFloat {
        if text.isEmpty {
            return 42
        } else {
            return 24
        }
    }
}
