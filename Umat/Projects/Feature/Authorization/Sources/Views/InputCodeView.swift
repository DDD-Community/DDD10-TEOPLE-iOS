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

public struct InputCodeView<Content: View>: View {
    
    // MARK: - Properties
    @FocusState private var focusState: Bool
    @ObservedObject private var viewModel: TextInputViewModel
    @State private var isPresented: Bool = false
    private let textInputType: TextInputType = .inputCode
    private let content: () -> Content
    
    // MARK: - Init
    public init(viewModel: TextInputViewModel, 
                content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
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
            .sync($viewModel.focusState, with: _focusState)
            .onAppear {
                viewModel.focusState = true
            }
        }
        .onAppear {
            viewModel.supportingText = ""
        }
    }
}


fileprivate extension InputCodeView {
    @ViewBuilder
    func textInput() -> some View {
        TextInput(guidanceText: textInputType.guidanceText,
                  text: $viewModel.matchedCoupleCode,
                  placeholder: textInputType.placeholder,
                  supportingText: $viewModel.supportingText,
                  focusState: $focusState,
                  stateColor: $viewModel.stateColor)
    }
    
    @ViewBuilder
    func footer() -> some View {
        GrayButton(text: "입력 완료",
                   buttonSize: .medium,
                   buttonState: viewModel.isEnabled ? .enabled : .disabled) {
            
            viewModel.signUpUser { data in
                // FIXME: - 내가 내 CoupleCode를 사용해도 가입되는 문제가 있음.(서버 확인)
                if data?.message == "Success" {
                    viewModel.supportingText = ""
                    viewModel.stateColor = nil
                    
                    isPresented = true
                } else {
                    viewModel.supportingText = "코드 입력이 잘못되었어요!"
                    viewModel.stateColor = .colors(.error)
                }
            }
        }
       .navigationDestination(isPresented: $isPresented, destination: {
           content()
       })
       .padding(.bottom, 12)
    }
}
