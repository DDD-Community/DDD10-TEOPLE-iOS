//
//  MainView.swift
//  Umai
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import Entity

struct MainView: View {
    @State private var isSelectedItem: TabItem = .left
    @State private var isPresented: Bool = true
    @State private var isCentered: Bool = false
    @State private var sheetHeight: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        let small = sheetHeight - BottomSheetOffset.small
        let medium = sheetHeight * BottomSheetOffset.mediumRate
        
        CustomTabView(isSelectedItem: $isSelectedItem) { item in
            ZStack {
                switch item {
                case .left:
                    
                    // TODO: 지도뷰
                    Text("지도")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.yellow)
                    
                    VStack(spacing: 32) {
                        RoundedRectangle(cornerRadius: 8) // 검색창 위치
                            .frame(maxWidth: .infinity)
                            .frame(height: 46)
                            .padding(.horizontal, 24)
                        
                        Spacer()
                    }
                case .center:
                    EmptyView()
                
                case .right:
                    
                    // TODO: 마이페이지 뷰
                    Text("마이페이지")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.red)
                }
                
                ZStack(alignment: .bottom) {
                    Color.black
                        .opacity(isCentered ? 0.4 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isCentered = false
                            
                            setupOffsetY(medium, small)
                        }
                    
                    VStack(spacing: 32) {
                        Spacer()
                            .frame(height: 46)
                        
                        GeometryReader { geometry in
                            BottomSheet(offsetY: $offsetY,
                                        sheetHeight: sheetHeight,
                                        content: {
                                
                                // TODO: 바텀시트 컨텐츠
                                VStack {
                                    ForEach(0..<100, id: \.self) {_ in
                                        Text("테스트용")
                                    }
                                }
                            })
                            .onAppear {
                                sheetHeight = geometry.size.height
                                offsetY = sheetHeight
                            }
                        }
                        .opacity(isPresented ? 1 : 0)
                    }
                }
            }
        } onTappedItem: { item in
            switch item {
            case .left:
                isPresented = true
                isCentered = false
                
                offsetY = small // TODO: 위치 수정
            case .center:
                isCentered.toggle()
                
                setupOffsetY(medium, small)
            case .right:
                isPresented = false
                isCentered = false
            }
        }
    }
    
    private func setupOffsetY(_ medium: CGFloat, _ small: CGFloat) {
        if isSelectedItem == .left {
            offsetY = isCentered ? medium : small
            isPresented = true
        } else {
            offsetY = isCentered ? medium : .infinity
            isPresented.toggle()
        }
    }
}

#Preview {
    MainView()
}
