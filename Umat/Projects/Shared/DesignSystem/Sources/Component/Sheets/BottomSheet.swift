//
//  BottomSheet.swift
//  DesignSystem
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import Utility

public enum BottomSheetOffset {
    public static let small: CGFloat = 200
    public static let mediumRate: CGFloat = 0.35
    public static let large: CGFloat = 0
}

public struct BottomSheet<Content: View>: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel = BottomSheetViewModel()
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
            content()
                .frame(maxWidth: .infinity)
                .padding(.bottom, 100)
                .background(.white)
        }
        .isBounce(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .ignoresSafeArea(edges: .bottom)
        .scrollIndicators(.never)
        .offset(y: sheetOffset)
        .shadow(color: .init(white: 0, opacity: 0.3),
                radius: 10)
        .overlay {
            scrollObservableView()
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    translation = gesture.translation
                }
                .onEnded { gesture in
                    withAnimation(.smooth(duration: 0.1)) {
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
    func configureBottomSheetOffsetY() {
        let current = translation.height + offsetY
        let medium = sheetHeight * BottomSheetOffset.mediumRate
        let small = sheetHeight - BottomSheetOffset.small
        
        if current > (BottomSheetOffset.large + medium)/2 && current < (medium+small)/2 {
            offsetY = sheetHeight * BottomSheetOffset.mediumRate // Medium
        } else if current >= (medium+small)/2 {
            offsetY = sheetHeight - BottomSheetOffset.small // Small
        } else {
            offsetY = BottomSheetOffset.large // Large
        }
    }
}
