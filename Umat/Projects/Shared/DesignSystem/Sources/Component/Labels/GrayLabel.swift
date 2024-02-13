//
//  GrayLabel.swift
//  DesignSystem
//
//  Created by 지준용 on 2/11/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

struct GrayLabel: View {
    private let leadingIcon: Icons?
    private let iconColor: Color?
    private let text: String
    private let buttonSize: ButtonSize
    private let buttonState: GrayButtonState
    private let maxWidth: CGFloat
    private let cornerRadius: CGFloat = 8
    
    init(leadingIcon: Icons? = nil,
                iconColor: Color? = nil,
                text: String,
                buttonSize: ButtonSize,
                buttonState: GrayButtonState,
                maxWidth: CGFloat = .infinity) {
        self.leadingIcon = leadingIcon
        self.iconColor = iconColor
        self.text = text
        self.buttonSize = buttonSize
        self.buttonState = buttonState
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        HStack(spacing: 6) {
            if let icon = leadingIcon?.image {
                icon
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundStyle(iconColor ?? buttonState.foregroundStyle)
                    .frame(width: buttonSize.icon,
                           height: buttonSize.icon)
            }
            
            Text(text)
                .fontModifier(buttonSize.font)
        }
        .padding(buttonSize.insets)
        .frame(maxWidth: maxWidth)
        .foregroundStyle(buttonState.foregroundStyle)
        .background(buttonState.background)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay(RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(buttonState.stroke)
        )
    }
}
