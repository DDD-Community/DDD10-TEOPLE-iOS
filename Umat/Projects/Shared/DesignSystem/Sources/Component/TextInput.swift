//
//  TextInput.swift
//  DesignSystem
//
//  Created by 지준용 on 2/6/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct TextInput: View {
    
    // MARK: - Properties
    let header: String
    @Binding var text: String
    let placeholder: String
    @Binding var supportingText: String
    let focusState: FocusState<Bool?>.Binding
    let focusValue: Bool
    @Binding var stateColor: Color?
    
    // MARK: - Init
    public init(header: String,
                text: Binding<String>,
                placeholder: String,
                supportingText: Binding<String>,
                focusState: FocusState<Bool?>.Binding,
                focusValue: Bool = true,
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
                .fontModifier(.pb12)
                .foregroundStyle(stateColor ?? .colors(.gray800))
                .padding(.bottom, 10)
            
            TextField(placeholder, text: $text)
                .fontModifier(.pb16)
                .foregroundStyle(.colors(.gray900))
                .focused(focusState, equals: focusValue)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
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

extension TextInput {
    enum TextInputState {
        case enable
        case disable
        case error
        case activate
    }
}
