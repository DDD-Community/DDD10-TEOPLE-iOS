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
        Image("squirrel", bundle: .module)
            .resizable()
            .frame(minHeight: 480)
            .padding(.top, 32)
    }
    
    @ViewBuilder
    func button() -> some View {
        Spacer(minLength: 130)
        
        GrayNavigationLink(text: "다음",
                           buttonSize: .medium,
                           buttonState: .enabled) {
            LoginView()
        }
        
        .padding(.bottom, 54)
    }
}

