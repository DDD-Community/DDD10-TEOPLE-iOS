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
    private let guidanceText: String
    @Binding private var text: String
    private let placeholder: String
    @Binding private var supportingText: String
    private let focusState: FocusState<T>.Binding
    private let focusValue: T
    @Binding private var stateColor: Color?
    
    // MARK: - Init
    public init(guidanceText: String,
                text: Binding<String>,
                placeholder: String,
                supportingText: Binding<String>,
                focusState: FocusState<T>.Binding,
                focusValue: T = true,
                stateColor: Binding<Color?>) {
        self.guidanceText = guidanceText
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
            Text(guidanceText)
                .lineSeedSans(.bold12)
                .foregroundStyle(stateColor ?? .colors(.gray800))
                .padding(.bottom, 10)
            
            TextField(placeholder, text: $text)
                .pretendard(.regular16)
                .foregroundStyle(.colors(.gray900))
                .focused(focusState, equals: focusValue)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(stateColor ?? .colors(.gray600))
                .padding(.bottom, 10)
            
            Text(supportingText)
                .pretendard(.regular12)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(stateColor ?? .colors(.gray600))
        }
    }
}


public enum TextInputState {
    case enable
    case disable
    case error
    case activate
}
