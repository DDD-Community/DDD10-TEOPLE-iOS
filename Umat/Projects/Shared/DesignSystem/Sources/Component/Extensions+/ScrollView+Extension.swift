//
//  ScrollView+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/18/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct ScrollViewModifier: ViewModifier {
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
