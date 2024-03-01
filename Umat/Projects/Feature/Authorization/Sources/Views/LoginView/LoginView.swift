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

//final class LoginViewModel: ObservableObject {
////    private let userRepository = UserRepository
//    
//    enum Action {
//        case didSelectLoginMethod(LoginMethod)
//    }
//    
//    func send(_ action: Action) {
//        
//    }
//}


public struct LoginView: View {
    
    // MARK: Properties
    @State private var appleSignInDelegate: SignInWithAppleDelegate! = nil
    @State private var isLogin: Bool = false
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        BaseView(isContentCentered: false) {
            header()
        } content: {
            buttons()
        } footer: {
            footer()
        }
        .navigationBarBackButtonHidden()
    }
}

fileprivate extension LoginView {
    @ViewBuilder
    func header() -> some View {
        Color.colors(.gray200)
            .frame(height: 480)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    Image.icons(.ic_pin)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.gradient())
                        .frame(width: 137, height: 137)
                        .padding(.top, 145)
                    
                    Text("맛나")
                        .font(.pretendard(.bold, size: 48))
                        .padding(.bottom, 73)
                }
            }
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
                    // TODO: MakeCodeView
                }
            }
            
            CustomNavigationLink(text: "둘러보기",
                                 font: .pretendard(.semiBold, size: 14),
                                 foregroundStyle: .colors(.gray600),
                                 background: .clear,
                                 height: 34,
                                 maxWidth: .infinity) {
                // TODO: 지도로 이동하기
                EmptyView()
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
            .foregroundStyle(.colors(.gray400))
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
