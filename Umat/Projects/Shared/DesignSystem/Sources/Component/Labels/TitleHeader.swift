//
//  TitleHeader.swift
//  DesignSystem
//
//  Created by 지준용 on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct TitleHeader: View {
    private let title: String
    private let titleFont: Font
    private let titleColor: Color
    private let subIcon: Icons?
    private let subTitle: String
    private let subTitleFont: Font
    private let subTitleColor: Color
    private let bottomPadding: CGFloat
    
    public init(title: String,
                titleFont: Font = .lineSeedSans(.bold, size: 20),
                titleColor: Color = .colors(.gray900),
                subIcon: Icons? = nil,
                subTitle: String = "",
                subTitleFont: Font = .pretendard(.semiBold, size: 16),
                subTitleColor: Color = .colors(.gray500),
                bottomPadding: CGFloat = 32) {
        self.title = title
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.subIcon = subIcon
        self.subTitle = subTitle
        self.subTitleFont = subTitleFont
        self.subTitleColor = subTitleColor
        self.bottomPadding = bottomPadding
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(titleFont)
                .foregroundStyle(titleColor)
            
            if !subTitle.isEmpty {
                HStack {
                    
                    // TODO: 아이콘의 종류 파악 필요
                    if let leadingIcon = subIcon?.image {
                        leadingIcon
                            .resizable()
                            .scaledToFit()
                    }
                    Text(subTitle)
                        .font(subTitleFont)
                        .foregroundStyle(subTitleColor)
                }
            }
        }
        .padding(.bottom, bottomPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
