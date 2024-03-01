//
//  OnboardingView.swift
//  Authorization
//
//  Created by 지준용 on 1/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct OnboardingView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        BaseView {
            onboarding()
        } footer: {
            button()
        }
        .padding(.horizontal, 24)
    }
}

fileprivate extension OnboardingView {
    @ViewBuilder
    func onboarding() -> some View {
        Spacer()
        
        Image("OnboardingImage", bundle: .module)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 494)
    }
    
    @ViewBuilder
    func button() -> some View {
        GrayButton(text: "맛나 시작하기",
                   buttonSize: .medium,
                   buttonState: .enabled) {
            self.dismiss()
        }
        .padding(.bottom, 56)
    }
}

