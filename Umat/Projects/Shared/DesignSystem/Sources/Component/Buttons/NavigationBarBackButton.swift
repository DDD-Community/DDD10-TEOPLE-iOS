//
//  NavigationBarBackButton.swift
//  DesignSystem
//
//  Created by 지준용 on 2/8/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct NavigationBarBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    public init() {}
    
    public var body: some View {
        Button {
            self.dismiss()
        } label: {
            Image.icons(.ic_arrow_back_filled)
                .resizable()
        }
    }
}


public extension View {
    @ViewBuilder
    func navigationBarBackButton() -> some View {
        self
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBarBackButton()
                }
            }
    }
}
