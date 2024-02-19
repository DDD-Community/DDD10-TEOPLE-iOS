//
//  BottomSheet.swift
//  DesignSystem
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public enum BottomSheetOffset {
    public static let small: CGFloat = 160
    public static let mediumRate: CGFloat = 0.35
    public static let large: CGFloat = 0
}

public struct BottomSheet<Content: View>: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = BottomSheetViewModel()
    @State private var translation: CGSize = .zero
    @Binding private var offsetY: CGFloat
    private let sheetHeight: CGFloat
    private let content: () -> Content
    
    private var sheetOffset: CGFloat {
        let current = translation.height + offsetY
        let medium = sheetHeight * BottomSheetOffset.mediumRate
        let small = sheetHeight - BottomSheetOffset.small
        
        if current >= (medium+small / 2) {
            return small
        } else if current > 25 {
            return current
        }
        return BottomSheetOffset.large
    }
    
    // MARK: - Init
    public init(offsetY: Binding<CGFloat>,
                sheetHeight: CGFloat,
                @ViewBuilder content: @escaping () -> Content) {
        self._offsetY = offsetY
        self.sheetHeight = sheetHeight
        self.content = content
    }
    
    // MARK: - Views
    public var body: some View {
        ScrollView {
            scrollObservableView()
            
            content()
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
                .background(.white)
        }
        .isBounce(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .ignoresSafeArea(edges: .bottom)
        .scrollDisabled(isDisabledScroll())
        .scrollIndicators(.never)
        .offset(y: sheetOffset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    scrollDirection(gesture)
                    
                    translation = gesture.translation
                }
                .onEnded { gesture in
                    viewModel.setupDirect(.none)
                    
                    withAnimation(.linear(duration: 0.1)) {
                        configureBottomSheetOffsetY()
                        
                        translation = .zero
                    }
                }
        )
        .onPreferenceChange(ScrollOffsetKey.self) {
            viewModel.setupOffset($0)
        }
    }
}

fileprivate extension BottomSheet {
    @ViewBuilder
    func scrollObservableView() -> some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).origin.y
            
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetY
                )
                .onAppear {
                    viewModel.setupOriginOffset(offsetY)
                }
        }
    }
}

// MARK: - Methods
fileprivate extension BottomSheet {
    func isDisabledScroll() -> Bool {
        if offsetY > BottomSheetOffset.large {
            return true
        }
        
        if viewModel.direct == .down && (viewModel.offset - BottomSheetOffset.small) == (viewModel.originOffset) {
            return true
        }
        
        return false
    }
    
    func scrollDirection(_ gesture: _ChangedGesture<DragGesture>.Value) {
        let snap = gesture.translation.height
        
        if snap > 0 {
            viewModel.setupDirect(.down)
        } else if snap < 0 {
            viewModel.setupDirect(.up)
        } else {
            viewModel.setupDirect(.none)
        }
    }
    
    func configureBottomSheetOffsetY() {
        let current = translation.height + offsetY
        let medium = sheetHeight * BottomSheetOffset.mediumRate
        let small = sheetHeight - BottomSheetOffset.small
        
        if current > (BottomSheetOffset.large + medium)/2 && current < (medium+small)/2 {
            offsetY = sheetHeight * BottomSheetOffset.mediumRate // Medium
        } else if current > (medium+small)/2 {
            offsetY = sheetHeight - BottomSheetOffset.small // Small
        } else {
            offsetY = BottomSheetOffset.large // Large
        }
    }
}
