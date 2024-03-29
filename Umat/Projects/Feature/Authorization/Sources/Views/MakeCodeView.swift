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


public struct MakeCodeView<Content: View>: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel: TextInputViewModel
    @State private var coupleCode: ActivityItem?
    @State private var isWritten = false
    @State private var isPresented = false
    @State private var isShared = false
    private let content: () -> Content
    
    // MARK: - Init
    public init(viewModel: TextInputViewModel, content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
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
        .popup(isPresented: $isPresented) {
            VStack {
                Color.white
                    .frame(height: Metric.statusHeight)
                
                if isShared {
                    toast(icon: .ic_check_outlined,
                          text: "코드 복사가 완료되었어요!",
                          backgroundColor: .colors(.gray600))
                } else if !isWritten {
                    toast(icon: .ic_warning_outlined,
                          text: "앗, 상대방이 아직 코드를 입력하지 않았어요!",
                          backgroundColor: .colors(.error))
                }
            }
        } customize: { view in
            view
                .type(.toast)
                .position(.topLeading)
                .autohideIn(3)
                .closeOnTap(false)
                .dragToDismiss(false)
                .dismissCallback {
                    isShared = false
                    isPresented = false
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
            guard let data = viewModel.coupleData?.data?.coupleCode else { return }
            self.coupleCode = ActivityItem(items: data)
        }
        .activitySheet($coupleCode) { activityType, success, items, error in
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
                
                // TODO: 상대방이 입력했을 때, 내가 연결됐는지 유무 확인
                print(viewModel.coupleData?.message)
            }
            .navigationDestination(isPresented: $isWritten) {
                EmptyView()
            }
            
            CustomNavigationLink(text: "상대방 코드 입력",
                                 foregroundStyle: .colors(.gray800),
                                 background: .white,
                                 strokeColor: .colors(.gray300)) {
                InputCodeView(viewModel: viewModel,
                              content: content)
            }
        }
        .padding(.horizontal, Metric.horizontalPadding)
        .padding(.bottom, 64)
    }
    
    @ViewBuilder
    func toast(icon: Icons, text: String, backgroundColor: Color) -> some View {
        HStack(spacing: 6) {
            Image.icons(icon)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 20)
            
            Text(text)
                .pretendard(.semiBold12)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.white)
        .padding(.leading, Metric.horizontalPadding)
        .frame(height: 56)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
    }
}

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


