//
//  CustomNavigationLink.swift
//  DesignSystem
//
//  Created by 지준용 on 2/11/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct GrayNavigationLink<Content: View>: View {
    
    // MARK: - Properties
    private let leadingIcon: Icons?
    private let iconColor: Color?
    private let text: String
    private let buttonSize: ButtonSize
    private let buttonState: GrayButtonState
    private let maxWidth: CGFloat
    private let content: Content
    private let cornerRadius: CGFloat = 8
    
    // MARK: - Init

    public init(leadingIcon: Icons? = nil,
                iconColor: Color? = nil,
                text: String,
                buttonSize: ButtonSize,
                buttonState: GrayButtonState,
                maxWidth: CGFloat = .infinity,
                content: @escaping () -> Content) {
        self.leadingIcon = leadingIcon
        self.iconColor = iconColor
        self.text = text
        self.buttonSize = buttonSize
        self.buttonState = buttonState
        self.maxWidth = maxWidth
        self.content = content()
    }
    
    // MARK: - Views
    public var body: some View {
        NavigationLink {
            content
        } label: {
            GrayLabel(leadingIcon: leadingIcon,
                      iconColor: iconColor,
                      text: text,
                      buttonSize: buttonSize,
                      buttonState: buttonState,
                      maxWidth: maxWidth)
        }
        .disabled(buttonState == .disabled ? true : false)
    }
}
