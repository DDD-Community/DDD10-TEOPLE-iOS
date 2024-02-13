//
//  NavigationBarBackButton.swift
//  DesignSystem
//
//  Created by 지준용 on 2/12/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct NavigationBarBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public init() {}
    
    public var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image.icons(.ic_arrow_back_filled)
                .resizable()
        }
    }
}
