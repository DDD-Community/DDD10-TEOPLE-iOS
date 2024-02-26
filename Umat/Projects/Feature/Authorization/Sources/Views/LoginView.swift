//
//  LoginView.swift
//  Authorization
//
//  Created by 지준용 on 1/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import Entity
import MarkPlace

public struct LoginView<Content: View>: View {
    let content: () -> Content
    
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
        Spacer()
        
        VStack(spacing: 16) {
            ForEach(LoginMethod.allCases, id: \.self) { method in
                CustomButton(icon: method.icon,
                             text: method.text,
                             foregroundStyle: method.foregroundStyle,
                             background: method.background) {
                    // TODO: 로그인 플로우
                    print(method.text)
                }
            }
            
            CustomNavigationLink(text: "둘러보기",
                                 font: .pretendard(.semiBold, size: 14),
                                 foregroundStyle: .colors(.gray600),
                                 background: .clear,
                                 height: 34,
                                 maxWidth: .infinity) {
                // TODO: 지도로 이동하기
                content()
            }
        }
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

// MARK: - LoginMethod
extension LoginMethod {
    var icon: Icons? {
        switch self {
        case .kakao:
            return .kakao
        case .apple:
            return .apple
        }
    }
    
    var text: String {
        switch self {
        case .kakao:
            return "카카오로 로그인하기"
        case .apple:
            return "Apple로 로그인하기"
        }
    }
    
    var foregroundStyle: Color {
        switch self {
        case .kakao:
            return .init(hex: "#262626")
        case .apple:
            return .white
        }
    }
    
    var background: Color {
        switch self {
        case .kakao:
            return .init(hex: "#FEE500")
        case .apple:
            return .colors(.gray950)
        }
    }
}
