//
//  Font+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 1/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


extension Font {
    static func fonts(_ font: Fonts.PretendardFonts) -> Font {
        return .init(UIFont.pretendard(font.design, size: font.size))
    }
    
    static func fonts(_ font: Fonts.LINEFonts) -> Font {
        return .init(UIFont.lineSeedSans(font.design, size: font.size))
    }
}
