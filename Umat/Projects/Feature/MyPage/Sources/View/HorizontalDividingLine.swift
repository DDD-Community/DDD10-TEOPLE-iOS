//
//  HorizontalDividingLine.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem

struct HorizontalDividingLine: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(Colors.gray300.color)
            .frame(width: 2, height: 54)
            .padding([.top, .bottom], 10)
    }
}

#Preview {
    HorizontalDividingLine()
}
