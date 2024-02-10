//
//  CustomFilter.swift
//  DesignSystem
//
//  Created by 지준용 on 2/9/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI


public struct CustomFilter: View {
    @Binding var isUpdated: Bool
    private let filterType: FilterType
    @Binding var isSelected: Bool
    @Binding var count: Int
    private let pinSize: CGFloat = 16
    
    public init(isUpdated: Binding<Bool>,
                filterType: FilterType,
                isSelected: Binding<Bool>,
                count: Binding<Int>) {
        self._isUpdated = isUpdated
        self.filterType = filterType
        self._isSelected = isSelected
        self._count = count
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            pin(isUpdated)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundStyle(filterType.color)
                .frame(width: pinSize, height: pinSize)
                .overlay {
                    if isUpdated {
                        Text("N")
                            .fontModifier(.ps10)
                            .foregroundStyle(.white)
                    }
                }
            
            Text("\(filterType.rawValue) \(count)")
                .fontModifier(.ps12)
        }
        .frame(width: 91, height: 32)
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .stroke(.colors(isSelected ? .gray800 : .gray300))
        }
        .onTapGesture {
            isSelected = true
            isUpdated = false
        }
    }
    
    private func pin(_ isUpdated: Bool) -> Image {
        if isUpdated {
            return .icons(.ic_pin_new)
        } else {
            return .icons(.ic_pin)
        }
    }
}
