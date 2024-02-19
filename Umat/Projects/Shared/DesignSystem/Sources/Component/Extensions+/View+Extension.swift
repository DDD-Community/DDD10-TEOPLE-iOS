//
//  View+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/8/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


// MARK: - HideKeyboard
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

// MARK: - navigationBarBackButton
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

// MARK: - SyncFocusState
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

// MARK: - RoundedCorner
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
