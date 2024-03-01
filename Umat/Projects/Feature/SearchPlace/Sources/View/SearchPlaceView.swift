//
//  SearchPlaceView.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem

public struct SearchPlaceView: View {
    private var backButtonAction: () -> Void
    @Binding var viewModel: UpperBarViewModel
    
    public var body: some View {
        HStack {
            Button {
                backButtonAction()
            } label: {
                Image.icons(.ic_arrow_back_filled)
            }
            
            TextField("공간명 검색", text: $viewModel.inputText)
        }
        
        // 검색 결과 리스트
    }
    
    public init(backButtonAction: @escaping () -> Void,
                viewModel: Binding<UpperBarViewModel>) {
        self.backButtonAction = backButtonAction
        self._viewModel = viewModel
    }
}
