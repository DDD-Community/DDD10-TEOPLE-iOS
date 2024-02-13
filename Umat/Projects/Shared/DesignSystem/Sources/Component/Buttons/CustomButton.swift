//
//  CustomButton.swift
//  DesignSystem
//
//  Created by 지준용 on 2/11/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct CustomButton<F: ShapeStyle, B: ShapeStyle>: View {
    private let icon: Icons?
    private let iconSize: CGFloat
    private let text: String
    private let foregroundStyle: F
    private let background: B
    private let strokeColor: Color
    private let height: CGFloat
    private let maxWidth: CGFloat
    private let cornerRadius: CGFloat
    private let action: () -> Void
    
    public init(icon: Icons? = nil,
                iconSize: CGFloat = 18,
                text: String,
                foregroundStyle: F,
                background: B,
                strokeColor: Color = .clear,
                height: CGFloat = 50,
                maxWidth: CGFloat = .infinity,
                cornerRadius: CGFloat = 8,
                action: @escaping () -> Void) {
        self.icon = icon
        self.iconSize = iconSize
        self.text = text
        self.foregroundStyle = foregroundStyle
        self.background = background
        self.strokeColor = strokeColor
        self.height = height
        self.maxWidth = maxWidth
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }, label: {
            CustomLabel(icon: icon,
                        iconSize: iconSize,
                        text: text,
                        foregroundStyle: foregroundStyle,
                        background: background,
                        strokeColor: strokeColor,
                        height: height,
                        maxWidth: maxWidth,
                        cornerRadius: cornerRadius)
        })
    }
}


