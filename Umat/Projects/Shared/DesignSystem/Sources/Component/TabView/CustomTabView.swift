//
//  CustomTabView.swift
//  DesignSystem
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct CustomTabView<Content: View>: View {
    
    // MARK: - Properties
    @Binding private var isSelectedItem: TabItem
    private let content: (TabItem) -> Content
    private let onTappedItem: ((TabItem) -> Void)?
    
    // MARK: - Init
    public init(isSelectedItem: Binding<TabItem>,
                @ViewBuilder content: @escaping (TabItem) -> Content,
                onTappedItem: ((TabItem) -> Void)? = nil) {
        self._isSelectedItem = isSelectedItem
        self.content = content
        self.onTappedItem = onTappedItem
    }
    
    // MARK: - Views
    public var body: some View {
        ZStack {
            content(isSelectedItem)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: 0) {
                Divider()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
                HStack() {
                    buttons()
                }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .horizontal)
                .background(.white)
            }
        }
    }
}

fileprivate extension CustomTabView {
    @ViewBuilder
    func buttons() -> some View {
        ForEach(TabItem.allCases, id: \.self) { item in
            Button {
                if !item.text.isEmpty {
                    isSelectedItem = item
                }
                
                action(item: item)
            } label: {
                buttonLabel(item: item)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 12)
        }
    }
    
    @ViewBuilder
    func buttonLabel(item: TabItem) -> some View {
        if item.text.isEmpty {
            item.image
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundStyle(.colors(.gray900))
                .frame(width: item.imageSize, height: item.imageSize)
        } else {
            VStack(spacing: 2) {
                item.image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundStyle(isSelectedItem == item ? item.selectedColor : item.unsSelectedColor)
                    .frame(width: item.imageSize, height: item.imageSize)
                
                Text(item.text)
                    .pretendard(.medium12)
                    .foregroundStyle(isSelectedItem == item ? item.selectedColor : item.unsSelectedColor)
            }
        }
    }
    
    // MARK: - Methods
    func action(item: TabItem) {
        guard onTappedItem != nil else { return }
        
        onTappedItem!(item)
    }
}
