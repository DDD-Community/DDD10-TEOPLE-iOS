//
//  SearchBarView.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/25/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem
import Utility

public struct SearchBarView: View {
    @State private var inputText: String = ""
    
    public var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Button {
                        Logger.print("Search button tapped")
                    } label: {
                        Image.icons(.ic_search_outlined)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 8)
                    
                    TextField("공간명 검색", text: $inputText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 46)
                }
                .background(Color.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
                .shadow(radius: 56)
                
                MyLocationButton()
                    .background(Color.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .shadow(radius: 56)
            }
            .padding(.horizontal, 24)
            
            
            Spacer()
        }
    }
    
    public init() { }
}
