//
//  MyPageView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/15/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem

public struct MyPageView: View {
    // MARK: - Stored Properties
    // View Model
    @ObservedObject public private(set) var viewModel: MyPageViewModel
    
    // View State Properties
    @State private var configIsPresented: Bool = false
    @State private var editProfileIsPresented: Bool = false
    
    // MARK: - Computed properties
    public var body: some View {
        NavigationStack {
            BaseView {
                VStack {
                    CustomToolBar(trailingIcon: .ic_settings_outlined, trailingAction: {
                        configIsPresented = true
                    })
                    // TODO: 설정은 풀 스크린 모달로 구현되어야 합니다
                    .navigationDestination(isPresented: $configIsPresented) {
                        ConfigView()
                    }
                    
                    Spacer()
                        .frame(height: 16)
                }
            } content: {
                VStack(spacing: 24) {
                    MeAndYouView(
                        couple: viewModel.couple,
                        editProfileIsPresented: $editProfileIsPresented
                    )
                    .navigationDestination(isPresented: $editProfileIsPresented) {
                        // TODO: 프로필 설정 뷰 작성 후 수정
                        Text("Edit Profile View")
                            .navigationTitle("프로필 설정")
                    }
                    
                    WishlistView(couple: viewModel.couple)
                        .frame(height: 100)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 8)
                        )
                        .padding(.horizontal, 24)
                    
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - init
    public init(viewModel: MyPageViewModel = MyPageViewModel()) {
        self.viewModel = viewModel
    }
}
