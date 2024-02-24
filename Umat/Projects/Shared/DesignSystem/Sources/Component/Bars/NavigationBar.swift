//
//  NavigationBar.swift
//  DesignSystem
//
//  Created by 지준용 on 2/15/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct CustomToolBar: View {
    
    // MARK: - Properties
    private let leadingIcon: Icons?
    private let title: String?
    private let trailingIcon: Icons?
    private let leadingAction: (() -> Void)?
    private let trailingAction: (() -> Void)?
    
    // MARK: - Init
    public init(leadingIcon: Icons? = nil,
                title: String? = nil,
                trailingIcon: Icons? = nil,
                leadingAction: (() -> Void)? = nil,
                trailingAction: (() -> Void)? = nil) {
        self.leadingIcon = leadingIcon
        self.title = title
        self.trailingIcon = trailingIcon
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
    }
    
    // MARK: - Views
    public var body: some View {
        HStack {
            barItem(icon: leadingIcon, action: leadingAction)
            
            Spacer()
            
            barItem(icon: trailingIcon, action: trailingAction)
        }
        .overlay {
            navigationTitle()
        }
        .padding(.horizontal, 24)
        .frame(height: 56)
        .frame(maxWidth: .infinity)
        .toolbar(.hidden)
    }
}

fileprivate extension CustomToolBar {
    @ViewBuilder
    func barItem(icon: Icons?, action: (() -> Void)?) -> some View {
        Button {
            if let action = action {
                return action()
            }
        } label: {
            if let icon = icon?.image {
                icon
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    @ViewBuilder
    func navigationTitle() -> some View {
        if let title = title {
            Text(title)
                .foregroundStyle(.colors(.gray900))
                .font(.pretendard(.bold, size: 16))
        }
    }
}
