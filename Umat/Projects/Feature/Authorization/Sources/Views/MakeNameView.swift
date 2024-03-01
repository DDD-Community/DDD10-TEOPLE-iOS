//
//  MakeNameView.swift
//  Authorization
//
//  Created by 지준용 on 1/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import Entity


public struct MakeNameView<Content: View>: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel = TextInputViewModel()
    @FocusState private var focusState: Bool
    @State private var isPresented = false
    @State private var coupleData: CoupleData?
    private let textInputType: TextInputType = .makeName
    private let content: () -> Content
    
    // MARK: - Init
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    // MARK: - View
    public var body: some View {
        BaseView {
            TitleHeader(title: textInputType.title)
        } content: {
            textInput()
        } footer: {
            nextButton()
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
        .padding(.bottom, 12)
        .navigationBarBackButton()
        .hideKeyboardOnTapBackground($focusState)
        .sync($viewModel.focusState, with: _focusState)
        .onAppear {
            viewModel.supportingText = "6자 이내, 한글로만 가능해요!"
            viewModel.focusState = true
        }
    }
}

fileprivate extension MakeNameView {
    @ViewBuilder
    func textInput() -> some View {
        TextInput(guidanceText: textInputType.guidanceText,
                  text: $viewModel.text,
                  placeholder: textInputType.placeholder,
                  supportingText: $viewModel.supportingText,
                  focusState: $focusState,
                  stateColor: $viewModel.stateColor)
        .onChange(of: viewModel.text) { oldValue, newValue in
            if textInputState(oldValue, newValue) == .enable {
                viewModel.stateColor = nil
                viewModel.isEnabled = true
            } else {
                viewModel.stateColor = .colors(.error)
                viewModel.isEnabled = false
            }
        }
    }
    
    @ViewBuilder
    func nextButton() -> some View {
        GrayButton(text: "작성 완료",
                   buttonSize: .medium,
                   buttonState: viewModel.isEnabled ? .enabled : .disabled) {
            viewModel.isEnabled = false
            
            viewModel.signUpUser { data in
                if let data = data {
                    viewModel.coupleData = data
                    
                    self.isPresented = true
                }
                
                viewModel.isEnabled = true
            }
        }.navigationDestination(isPresented: $isPresented) {
            MakeCodeView(viewModel: viewModel, content: content)
        }
    }
}

// MARK: - Methods
extension View {
    func textInputState(_ oldValue: String, _ newValue: String) -> TextInputState {
        if !isValidateTextInput(oldValue, newValue) {
            return .error
        } else {
            return .enable
        }
    }
    
    func isValidateTextInput(_ oldValue: String, _ newValue: String) -> Bool {
        if (!oldValue.isEmpty && newValue.isEmpty) ||
            newValue.count > 6 ||
            !newValue.isKoreanLanguage() {
            return false
        }
        return true
    }
}
