//
//  CustomLabel.swift
//  DesignSystem
//
//  Created by 지준용 on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


struct CustomLabel<F: ShapeStyle, B: ShapeStyle>: View {
    private let icon: Icons?
    private let iconSize: CGFloat
    private let text: String
    private let font: Font
    private let foregroundStyle: F
    private let background: B
    private let strokeColor: Color
    private let height: CGFloat
    private let maxWidth: CGFloat
    private let cornerRadius: CGFloat
    
    public init(icon: Icons? = nil,
                iconSize: CGFloat,
                text: String,
                font: Font = .pretendard(.semiBold, size: 16),
                foregroundStyle: F,
                background: B,
                strokeColor: Color = .clear,
                height: CGFloat,
                maxWidth: CGFloat = .infinity,
                cornerRadius: CGFloat) {
        self.icon = icon
        self.iconSize = iconSize
        self.text = text
        self.font = font
        self.foregroundStyle = foregroundStyle
        self.background = background
        self.strokeColor = strokeColor
        self.height = height
        self.maxWidth = maxWidth
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if let leadingIcon = icon?.image {
                leadingIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)
            }
            
            Text(text)
                .font(font)
                .pretendard(.semiBold16)
        }
        .frame(height: height)
        .frame(maxWidth: maxWidth)
        .foregroundStyle(foregroundStyle)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(strokeColor)
        }
    }
}
