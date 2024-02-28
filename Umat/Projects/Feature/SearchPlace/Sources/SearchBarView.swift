//
//  SearchBarView.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/25/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import CoreLocation
import SwiftUI

import DesignSystem
import Utility

public struct SearchBarView: View {
    @State private var inputText: String = ""
    private var localAreaButtonAction: () -> Void
    
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
                .shadow(radius: 4)
                
                LocalAreaButton {
                    localAreaButtonAction()
                }
                .background(Color.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
                .shadow(radius: 4)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
    }
    
    public init(localAreaButtonAction: @escaping () -> Void) {
        self.localAreaButtonAction = localAreaButtonAction
    }
}
