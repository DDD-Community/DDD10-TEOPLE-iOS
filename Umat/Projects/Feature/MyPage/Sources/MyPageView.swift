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
            VStack {
                Text("Item 1")
                
                Text("Item 2")
                
                Text("Item 3")
            }
        } footer: {
            Text("This is footer area")
        }
    }
    
    public init() { }
}

#Preview {
    MyPageView()
}
