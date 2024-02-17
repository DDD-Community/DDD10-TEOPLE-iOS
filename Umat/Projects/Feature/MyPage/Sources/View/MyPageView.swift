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
    
    public var body: some View {
        BaseView {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        print("Button pressed")
                    } label: {
                        Image.icons(.ic_settings_outlined)
                    }
                }
                .padding(16)
                
                Spacer()
                    .frame(height: 32)
            }
        } content: {
            VStack(spacing: 24) {
                // TODO: 세팅 화면으로 넘어가야 합니다
                MeAndYouView(couple: $viewModel.couple)
                    .padding(.horizontal, 24)
                
                WishlistView(couple: $viewModel.couple)
                    .frame(height: 100)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .padding(.horizontal, 24)
            }
        } footer: {
            Text("This is footer area")
        }
    }
    
    public init(viewModel: MyPageViewModel = MyPageViewModel()) {
        self.viewModel = viewModel
    }
}

#Preview {
    MyPageView()
}
