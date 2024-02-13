//
//  GrayButton.swift
//  DesignSystem
//
//  Created by 지준용 on 2/8/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct GrayButton: View {
    
    // MARK: - Properties
    private let leadingIcon: Icons?
    private let iconColor: Color?
    private let text: String
    private let buttonSize: ButtonSize
    private let buttonState: GrayButtonState
    private let maxWidth: CGFloat
    private let action: () -> Void
    private let cornerRadius: CGFloat = 8
    
    // MARK: - Init

    public init(leadingIcon: Icons? = nil,
                iconColor: Color? = nil,
                text: String,
                buttonSize: ButtonSize,
                buttonState: GrayButtonState,
                maxWidth: CGFloat = .infinity,
                action: @escaping () -> Void) {
        self.leadingIcon = leadingIcon
        self.iconColor = iconColor
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
            GrayLabel(leadingIcon: leadingIcon,
                      iconColor: iconColor,
                      text: text,
                      buttonSize: buttonSize,
                      buttonState: buttonState,
                      maxWidth: maxWidth)
        })
        .disabled(buttonState == .disabled ? true : false)
    }
}
