//
//  TextInput.swift
//  DesignSystem
//
//  Created by 지준용 on 2/6/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct TextInput<T: Hashable>: View {
    
    // MARK: - Properties
    private let header: String
    @Binding private var text: String
    private let placeholder: String
    @Binding private var supportingText: String
    private let focusState: FocusState<T>.Binding
    private let focusValue: T
    @Binding private var stateColor: Color?
    
    // MARK: - Init
    public init(header: String,
                text: Binding<String>,
                placeholder: String,
                supportingText: Binding<String>,
                focusState: FocusState<T>.Binding,
                focusValue: T = true,
                stateColor: Binding<Color?>) {
        self.header = header
        self._text = text
        self.placeholder = placeholder
        self._supportingText = supportingText
        self.focusState = focusState
        self.focusValue = focusValue
        self._stateColor = stateColor
    }
    
    // MARK: - Views
    public var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .fontModifier(.lb20)
                .foregroundStyle(stateColor ?? .colors(.gray800))
                .padding(.bottom, 10)
            
            TextField(placeholder, text: $text)
                .fontModifier(.pb16)
                .foregroundStyle(.colors(.gray900))
                .focused(focusState, equals: focusValue)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .onChange(of: text) { oldValue, newValue in
                    switch textInputState(oldValue, newValue) {
                    case .enable:
                        stateColor = nil
                    case .disable:
                        stateColor = .colors(.gray400)
                    case .error:
                        stateColor = .colors(.error)
                    case .activate:
                        stateColor = .colors(.blue600)
                    }
                }
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(stateColor ?? .colors(.gray600))
                .padding(.bottom, 10)
            
            Text(supportingText)
                .fontModifier(.pr12)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(stateColor ?? .colors(.gray600))
        }
        .padding(.horizontal, 22)
    }
    
    // MARK: - Methods
    private func textInputState(_ oldValue: String, _ newValue: String) -> TextInputState {
        if !isValidateTextInput(oldValue, newValue) {
            return .error
        } else {
            return .enable
        }
    }
    
    private func isValidateTextInput(_ oldValue: String, _ newValue: String) -> Bool {
        if (!oldValue.isEmpty && newValue.isEmpty) ||
            newValue.count > 6 ||
            !newValue.isKoreanLanguage() {
            return false
        }
        return true
    }
}

extension TextInput {
    private enum TextInputState {
        case enable
        case disable
        case error
        case activate
    }
}
