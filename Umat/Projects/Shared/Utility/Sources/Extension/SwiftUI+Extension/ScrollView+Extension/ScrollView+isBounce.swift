//
//  ScrollView+isBounce.swift
//  Utility
//
//  Created by 지준용 on 2/24/24.
//

import SwiftUI


struct ScrollViewModifier: ViewModifier {
    public init(isBounce: Bool) {
        UIScrollView.appearance().bounces = isBounce
    }

    public func body(content: Content) -> some View {
        content
    }
}

extension ScrollView {
    public func isBounce(_ isBounce: Bool) -> some View {
        self.modifier(ScrollViewModifier(isBounce: isBounce))
    }
}
