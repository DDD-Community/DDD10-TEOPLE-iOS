//
//  LoginView.swift
//  Authorization
//
//  Created by 지준용 on 1/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import UIKit
import SwiftUI
import AuthenticationServices

import MarkPlace
import DesignSystem
import Entity


public struct LoginView<Content: View>: View {
    
    // MARK: Properties
    @State private var appleSignInDelegate: SignInWithAppleDelegate! = nil
    @State private var isLogin: Bool = false
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    private let content: () -> Content
    
    // MARK: - Init
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    // MARK: - Views
    public var body: some View {
        BaseView(isContentCentered: false) {
            header()
        } content: {
            buttons()
        } footer: {
            footer()
        }
        .background(.colors(.orange500))
        .navigationBarBackButtonHidden()
        .fullScreenCover(isPresented: $isOnboarding, content: {
            OnboardingView()
        })
        .onAppear {
            isOnboarding = true
        }
    }
}

fileprivate extension LoginView {
    @ViewBuilder
    func header() -> some View {
        VStack(spacing: 14) {
            Image.icons(.ic_pin)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.colors(.gray50))
                .frame(width: 100, height: 100)
            
            Text("둘만의 맛집 아카이빙, 맛나")
                .font(.pretendard(.bold, size: 16))
                .foregroundStyle(.colors(.gray50))
            
            Image.icons(.manna_title)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.colors(.gray50))
                .frame(width: 120, height: 22)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.top, 200)
    }
    
    @ViewBuilder
    func buttons() -> some View {
        VStack(spacing: 16) {
            ForEach(LoginMethod.allCases, id: \.self) { method in
                CustomButton(icon: method.icon,
                             text: method.text,
                             foregroundStyle: method.foregroundStyle,
                             background: method.background) {
                    // TODO: 로그인 플로우
                    switch method {
                    case .apple:
                        showAppleLogin()
                    case .kakao:
                        print(method.text)
                    }
                }.navigationDestination(isPresented: $isLogin) {
                    MakeNameView()
                }
            }
            
            CustomNavigationLink(text: "둘러보기",
                                 font: .pretendard(.semiBold, size: 14),
                                 foregroundStyle: .white,
                                 background: .clear,
                                 height: 34,
                                 maxWidth: .infinity) {
                content()
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 16)
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    func footer() -> some View {
        Text("로그인 시 개인정보처리방침과 이용약관에 동의하게 됩니다")
            .pretendard(.medium12)
            .foregroundStyle(.colors(.orange900))
            .padding(.bottom, 54)
            .padding(.horizontal, 24)
    }
}

// MARK: - Apple Login
fileprivate extension LoginView {
    func showAppleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        performSignIn(using: [request])
    }
    
    func performSignIn(using requests: [ASAuthorizationRequest]) {
        appleSignInDelegate = SignInWithAppleDelegate(window: window, signInSucceeded: { success in
            if success {
                isLogin = true
            } else {
                print(!success)
            }
        })
        
        let controller = ASAuthorizationController(authorizationRequests: requests)
        controller.delegate = appleSignInDelegate
        controller.presentationContextProvider = appleSignInDelegate
        controller.performRequests()
    }
}
