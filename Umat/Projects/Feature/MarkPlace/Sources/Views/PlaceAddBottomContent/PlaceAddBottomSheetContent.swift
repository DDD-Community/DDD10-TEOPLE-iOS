//
//  PlaceAddBottomSheetContent.swift
//  MarkPlace
//
//  Created by 지준용 on 2/23/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct PlaceAddBottomSheetContent: View {
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        BaseView {
            title()
        } content: {
            content()
        }
    }
}

fileprivate extension PlaceAddBottomSheetContent {
    @ViewBuilder
    func title() -> some View {
        Text("장소 추가하기")
            .pretendard(.bold16)
            .padding(.top, 18)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func content() -> some View {
        VStack(spacing: 0) {
            moveToNaverMapButton()
            
            guidanceLabel()
            
            confirmMethodButton()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func moveToNaverMapButton() -> some View {
        VStack(spacing: 6) {
            HStack(spacing: 6) {
                Image.icons(.ic_location_check_filled)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                
                Text("지도앱에서 공유하기로 추가")
                    .pretendard(.semiBold18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("네이버 지도 앱으로 이동합니다")
                .pretendard(.semiBold14)
                .opacity(0.6)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 15)
        .foregroundStyle(.white)
        .background(.colors(.both))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.bottom, 20)
        .onTapGesture {
            openNaverMapApp()
        }
    }
    
    @ViewBuilder
    func guidanceLabel() -> some View {
        TextWithColoredSubstring(originalText: "앗, 지도앱에서 공유하기로 추가가 뭔가요?",
                                 coloredSubstring: "지도앱에서 공유하기로 추가",
                                 originalColor: .colors(.gray900),
                                 substringColor: .colors(.both))
        .padding(.bottom, 20)
        .pretendard(.semiBold12)
    }
    
    @ViewBuilder
    func confirmMethodButton() -> some View{
        Button {
            // TODO: - 동작 미정
            print("방법 보기")
        } label: {
            Text("방법 보기")
                .pretendard(.semiBold14)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .foregroundStyle(.colors(.gray800))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.colors(.gray300))
                }
        }
    }
}
