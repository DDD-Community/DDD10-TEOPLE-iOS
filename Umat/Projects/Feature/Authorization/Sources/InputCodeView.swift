//
//  InputCodeView.swift
//  Authorization
//
//  Created by 지준용 on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import Entity

public struct InputCodeView: View {
    
    // MARK: - Properties
    @State private var text: String = ""
    @State private var supportingText: String = "코드 입력이 잘못되었어요!"
    @FocusState private var focusState: Bool
    @State private var stateColor: Color? = nil
    private let textInputType: TextInputType = .inputCode
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        VStack {
            BaseView {
                TitleHeader(title: textInputType.title,
                            subTitle: textInputType.subTitle)
                .padding(.top, 16)
            } content: {
                textInput()
            } footer: {
                footer()
            }
            .padding(.horizontal, 24)
            .navigationBarBackButton()
            .hideKeyboardOnTapBackground($focusState)
            .onAppear {
                focusState = true
            }
        }
    }
}


fileprivate extension InputCodeView {
    @ViewBuilder
    func textInput() -> some View {
        TextInput(guidanceText: textInputType.guidanceText,
                  text: $text,
                  placeholder: textInputType.placeholder,
                  supportingText: $supportingText,
                  focusState: $focusState,
                  stateColor: $stateColor)
    }
    
    @ViewBuilder
    func footer() -> some View {
        GrayNavigationLink(text: "입력 완료",
                           buttonSize: .medium,
                           buttonState: .disabled) {
            // TODO: 메인화면으로 이동
            EmptyView()
        }
        .padding(.bottom, 12)
    }
}
