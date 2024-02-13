//
//  CustomTab.swift
//  DesignSystem
//
//  Created by 지준용 on 2/10/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct CustomTab: View {
    private let tabType: TabType
    private let imageSize: CGFloat = 16
    @Binding var isSelected: Bool
    
    public init(tabType: TabType, isSelected: Binding<Bool>) {
        self.tabType = tabType
        self._isSelected = isSelected
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            tabType.image
                .resizable()
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
            
            Text("\(tabType.rawValue)")
                .pretendard(.ps14)
                .foregroundStyle(.colors(.gray700))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(.capsule)
        .shadow(color: .init(white: 0, opacity: 0.24),
                radius: 2,
                y: 2)
        .overlay {
            Capsule()
                .stroke(.colors(isSelected ? .gray600 : .gray300))
        }
        .onTapGesture {
            isSelected = true
        }
    }
}
