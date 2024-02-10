//
//  TabType.swift
//  DesignSystem
//
//  Created by 지준용 on 2/10/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public enum TabType: String, CaseIterable {
    case doIt = "가볼래"
    case didIt = "가봤어"
    
    var image: Image {
        switch self {
        case .doIt:
            return .icons(.ic_pin)
        case .didIt:
            return .icons(.ic_love)
        }
    }
}
