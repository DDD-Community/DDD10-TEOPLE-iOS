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
    @ObservedObject public private(set) var viewModel: MyPageViewModel
    
    @State private var configIsPresented: Bool = false
    @State private var editProfileIsPresented: Bool = false
    
    public var body: some View {
        NavigationStack {
            BaseView {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            configIsPresented = true
                        } label: {
                            Image.icons(.ic_settings_outlined)
                        }
                        .sheet(isPresented: $configIsPresented, content: {
                            ConfigView()
                        })
                    }
                    .padding(16)
                    
                    Spacer()
                        .frame(height: 32)
                }
            } content: {
                VStack(spacing: 24) {
                    // TODO: 세팅 화면으로 넘어가야 합니다
                    ZStack(alignment: .trailing) {
                        MeAndYouView(couple: $viewModel.couple)
                            .padding(.horizontal, 24)
                        
                        Button {
                            print("Pushing Button")
                            editProfileIsPresented = true
                        } label: {
                            Image.icons(.ic_arrow_forward_filled)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, 24)
                        }
                        .navigationDestination(isPresented: $editProfileIsPresented) {
                            Text("Edit Profile View")
                                .navigationTitle("프로필 설정")
                        }
                    }
                    
                    WishlistView(couple: $viewModel.couple)
                        .frame(height: 100)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 8)
                        )
                        .padding(.horizontal, 24)
                    
                    Spacer()
                }
            } footer: {
                Text("This is footer area")
            }
        }
    }
    
    public init(viewModel: MyPageViewModel = MyPageViewModel()) {
        self.viewModel = viewModel
    }
}

#Preview {
    MyPageView()
}
