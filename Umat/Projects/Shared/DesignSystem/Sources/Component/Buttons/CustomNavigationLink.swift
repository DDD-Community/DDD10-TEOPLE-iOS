//
//  CustomNavigationLink.swift
//  DesignSystem
//
//  Created by 지준용 on 2/12/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct CustomNavigationLink<Content: View, F: ShapeStyle, T: ShapeStyle>: View {
    
    // MARK: - Properties
    private let icon: Icons?
    private let iconSize: CGFloat
    private let text: String
    private let font: Font
    private let foregroundStyle: F
    private let background: T
    private let strokeColor: Color
    private let height: CGFloat
    private let maxWidth: CGFloat
    private let cornerRadius: CGFloat
    private let content: Content
    
    // MARK: - Init
    public init(icon: Icons? = nil,
                iconSize: CGFloat = 18,
                text: String,
                font: Font = .pretendard(.semiBold, size: 16),
                foregroundStyle: F,
                background: T,
                strokeColor: Color = .clear,
                height: CGFloat = 50,
                maxWidth: CGFloat = .infinity,
                cornerRadius: CGFloat = 8,
                content: @escaping () -> Content) {
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
        self.content = content()
    }
    
    // MARK: - Views
    public var body: some View {
        NavigationLink {
            content
        } label: {
            CustomLabel(icon: icon,
                        iconSize: iconSize,
                        text: text,
                        font: font,
                        foregroundStyle: foregroundStyle,
                        background: background,
                        strokeColor: strokeColor,
                        height: height,
                        maxWidth: maxWidth,
                        cornerRadius: cornerRadius)
        }
    }
}
