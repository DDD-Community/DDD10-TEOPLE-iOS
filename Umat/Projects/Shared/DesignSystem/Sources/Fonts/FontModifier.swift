//
//  FontModifier.swift
//  DesignSystem
//
//  Created by 지준용 on 1/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import UIKit


public extension View {
    @ViewBuilder 
    func pretendard(_ typo: Fonts.PretendardFonts) -> some View {
        modifier(PretendardFontModifier(font: typo))
    }
    
    @ViewBuilder 
    func lineSeedSans(_ typo: Fonts.LINEFonts) -> some View {
        modifier(LINEFontModifier(font: typo))
    }
}

fileprivate struct PretendardFontModifier: ViewModifier {
    private let font: Fonts.PretendardFonts
    
    init(font: Fonts.PretendardFonts) {
        self.font = font
    }
    
    func body(content: Content) -> some View {
        content
            .font(.fonts(font))
    }
}

fileprivate struct LINEFontModifier: ViewModifier {
    private let font: Fonts.LINEFonts
    
    init(font: Fonts.LINEFonts) {
        self.font = font
    }
    
    func body(content: Content) -> some View {
        content
            .font(.fonts(font))
    }
}
