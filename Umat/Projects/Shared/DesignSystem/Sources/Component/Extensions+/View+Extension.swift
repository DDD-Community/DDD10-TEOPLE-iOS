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
