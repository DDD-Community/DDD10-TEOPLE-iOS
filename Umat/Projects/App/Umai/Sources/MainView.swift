//
//  MainView.swift
//  Umai
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import CoreLocation
import SwiftUI

import DesignSystem
import Maps
import MarkPlace
import MyPage
import SearchPlace


struct MainView: View {
    
    // MARK: - Properties
    @State private var isSelectedItem: TabItem = .left
    @State private var isPresented: Bool = true
    @State private var isCentered: Bool = false
    @State private var sheetHeight: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    
    @State private var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.5453577, longitude:126.9525465)
    @State private var isLocalAreaMarked: Bool = false
    
    private var homeBottomSheetContent = HomeBottomSheetContent()
    private var placeAddBottomSheetContent = PlaceAddBottomSheetContent()
    
    // MARK: - Views
    var body: some View {
        let small = sheetHeight - BottomSheetOffset.small
        let medium = sheetHeight * BottomSheetOffset.mediumRate
        
        CustomTabView(isSelectedItem: $isSelectedItem) { item in
            ZStack {
                switch item {
                case .left:
                    NaverMapView(location: location, isLocalAreaMarked: isLocalAreaMarked)
                        .ignoresSafeArea(.all)
                    
                    SearchBarView {
                        isLocalAreaMarked.toggle()
                    }
            
                case .center:
                    EmptyView()
                
                case .right:
                    MyPageView()
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
                        Spacer(minLength: 46)
                        
                        bottomSheet()
                    }
                }
            }
        } onTappedItem: { item in
            switch item {
            case .left:
                isPresented = true
                isCentered = false
                
                withAnimation {
                    offsetY = small
                }
            case .center:
                isCentered.toggle()
                
                setupOffsetY(medium, small)
            case .right:
                isPresented = false
                isCentered = false
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension MainView {
    
    @ViewBuilder
    func bottomSheet() -> some View {
        GeometryReader { geometry in
            
            BottomSheet(offsetY: $offsetY,
                        sheetHeight: sheetHeight,
                        content: {
                if isCentered  {
                    placeAddBottomSheetContent
                } else {
                    homeBottomSheetContent
                }
            })
            .onChange(of: geometry.size, {
                sheetHeight = geometry.size.height
                offsetY = sheetHeight - BottomSheetOffset.small
            })
        }
        .opacity(isPresented ? 1 : 0)
    }
    
    private func setupOffsetY(_ medium: CGFloat, _ small: CGFloat) {
        if isSelectedItem == .left {
            withAnimation {
                offsetY = isCentered ? medium : small
            }
            
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
