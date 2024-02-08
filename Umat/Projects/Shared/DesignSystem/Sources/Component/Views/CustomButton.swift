//
//  CustomButton.swift
//  DesignSystem
//
//  Created by 지준용 on 2/8/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct CustomButton: View {
    
    // MARK: - Properties
    private let leadingIcon: Icons?
    private let text: String
    private let buttonSize: ButtonSize
    private let buttonState: ButtonState
    private let maxWidth: CGFloat
    private let action: () -> Void
    private let cornerRadius: CGFloat = 8
    
    // MARK: - Init

    public init(leadingIcon: Icons? = nil,
                text: String,
                buttonSize: ButtonSize,
                buttonState: ButtonState,
                maxWidth: CGFloat = .infinity,
                action: @escaping () -> Void) {
        self.leadingIcon = leadingIcon
        self.text = text
        self.buttonSize = buttonSize
        self.buttonState = buttonState
        self.maxWidth = maxWidth
        self.action = action
    }
    
    // MARK: - Views
    public var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 6) {
                if let icon = leadingIcon?.image {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: buttonSize.icon, height: buttonSize.icon)
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
                .stroke(buttonState.stroke, lineWidth: 1)
            )
        })
    }
}
