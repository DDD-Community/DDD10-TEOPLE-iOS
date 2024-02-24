//
//  View+keyboard.swift
//  Utility
//
//  Created by 지준용 on 2/24/24.
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
