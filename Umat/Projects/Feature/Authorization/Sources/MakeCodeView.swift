//
//  MakeCodeView.swift
//  Authorization
//
//  Created by 지준용 on 1/31/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem
import PopupView


// 서버에서 상대방 접속 여부 확인했다는 가정을 위한 간단 모델입니다.
struct MakeCodeModel {
    let isConnected: Bool = false
}

public struct MakeCodeView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @State private var data: ActivityItem? = nil
    @State private var isWritten = false
    @State private var isShared = false
    private let model = MakeCodeModel()
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        VStack {
            CustomToolBar(leadingIcon: .ic_arrow_back_filled,
                          leadingAction: {
                self.dismiss()
            })
            
            BaseView(isContentCentered: false) {
                TitleHeader(title: "똑똑, 비밀 코드가 도착했어요!",
                            subTitle: "둘만의 지도를 만들기 위해서 비밀 코드를 드릴게요.",
                            subTitleFont: .pretendard(.semiBold, size: 14))
                .padding(.top, Metric.topPadding)
                .padding(.horizontal, Metric.horizontalPadding)
            } content: {
                sharingCode()
            } footer: {
                buttons()
            }
        }
    }
}

private extension MakeCodeView {
    @ViewBuilder
    func sharingCode() -> some View {
        Image(isShared ? Letter.send.rawValue : Letter.send_not.rawValue, bundle: .module)
            .resizable()
            .scaledToFit()
            .frame(height: 243)
            .padding(.bottom, 16)
        
        CustomButton(text: "코드 공유",
                     font: .pretendard(.semiBold, size: 14),
                     foregroundStyle: .white,
                     background: .gradient(),
                     height: 40,
                     maxWidth: 91) {
            // TODO: (서버에서 받은) 코드
            data = ActivityItem(items: "테스트 메시지")
        }
        .activitySheet($data) { activityType, success, items, error in
            if error != nil {
                return debugPrint("activitySheet Error: \(error!)")
            }
            
            if success {
                isPresented = true
                isShared = true
            }
        }
        .padding(.horizontal, Metric.horizontalPadding)
        .padding(.bottom, Metric.bottomPadding)
    }
    
    @ViewBuilder
    func buttons() -> some View {
        VStack(spacing: 16) {
            GrayButton(text: "상대방이 코드를 입력했어요",
                       buttonSize: .medium,
                       buttonState: isPresented ? .disabled : .enabled) {
                
                if !model.isConnected {
                    self.isPresented = true
                } else {
                    isWritten = true
                }
            }
            .navigationDestination(isPresented: $isWritten) {
                EmptyView()
            }
            
            CustomNavigationLink(text: "상대방 코드 입력",
                                 foregroundStyle: .colors(.gray800),
                                 background: .white,
                                 strokeColor: .colors(.gray300)) {
                InputCodeView()
            }
        }
        .padding(.horizontal, Metric.horizontalPadding)
        .padding(.bottom, 64)
    }
    

// MARK: - Nested Types
fileprivate extension MakeCodeView {
    enum Letter: String {
        case send
        case send_not
    }
    
    // MARK: - Enum
    enum Metric {
        static let statusHeight: CGFloat = 54
        static let topPadding: CGFloat = 16
        static let horizontalPadding: CGFloat = 24
        static let bottomPadding: CGFloat = 80
    }
}

