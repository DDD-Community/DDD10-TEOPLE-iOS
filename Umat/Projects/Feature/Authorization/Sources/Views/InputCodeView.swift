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
    @State private var text = ""
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
                viewModel.supportingText = "코드 입력이 잘못되었어요!"
                viewModel.focusState = true
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
                  supportingText: $viewModel.supportingText,
                  focusState: $focusState,
                  stateColor: $viewModel.stateColor)
    }
    
    @ViewBuilder
    func footer() -> some View {
        GrayButton(text: "입력 완료",
                   buttonSize: .medium,
                   buttonState: viewModel.isEnabled ? .enabled : .disabled) {
            isPresented = true
        }
       .navigationDestination(isPresented: $isPresented, destination: {
           content()
       })
       .padding(.bottom, 12)
    }
}
