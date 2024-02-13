//
//  Font+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 1/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

// MARK: - Font Custom
public extension Font {
    static func fonts(_ font: Fonts.PretendardFonts) -> Font {
        return .init(UIFont.pretendard(font.design, size: font.size))
    }
    
    static func fonts(_ font: Fonts.LINEFonts) -> Font {
        return .init(UIFont.lineSeedSans(font.design, size: font.size))
    }
}

// MARK: - Font Register
public extension Font {
    static func registerFonts() {
        for font in Pretendard.allCases {
            Font.registerFont(module: .module, fontName: font.rawValue)
        }
        
        for font in LINESeedSans.allCases {
            Font.registerFont(module: .module, fontName: font.rawValue)
        }
    }
}

extension Font {
    static func registerFont(module: Bundle, fontName: String) {
        guard let url = module.url(forResource: fontName, withExtension: ".otf") else {
            return debugPrint("Font Register 실패: fontName 또는 파일 확장자를 확인하세요.")
        }
        
        if !CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil) {
            return debugPrint("Font Register 실패: 이미 등록되어있는 폰트입니다.")
        }
    }
}
