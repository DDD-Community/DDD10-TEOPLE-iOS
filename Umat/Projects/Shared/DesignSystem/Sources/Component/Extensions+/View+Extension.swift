//
//  View+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/8/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder 
    func hideKeyboardOnTapBackground( _ focusState: FocusState<Bool>.Binding,
                                                  _ color: Color = .white) -> some View {
        self
            .background(
                color
                    .onTapGesture {
                        focusState.wrappedValue = false
                    }
            )
    }
}

public extension View {
    @ViewBuilder 
    func navigationBarBackButton() -> some View {
        self
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBarBackButton()
                }
            }
    }
}

public extension View {
    func sync<T: Equatable>(_ binding: Binding<T>, with focusState: FocusState<T>) -> some View {
        self
            .onChange(of: binding.wrappedValue) {
                focusState.wrappedValue = binding.wrappedValue
            }
            .onChange(of: focusState.wrappedValue) {
                binding.wrappedValue = focusState.wrappedValue
            }
    }
}
