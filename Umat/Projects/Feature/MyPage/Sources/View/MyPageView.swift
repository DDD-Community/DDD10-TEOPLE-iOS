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
            VStack(spacing: 32) {
                MeAndYouView(couple: $viewModel.couple)
                
                WishlistView(couple: $viewModel.couple)
                    .frame(height: 100)
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
