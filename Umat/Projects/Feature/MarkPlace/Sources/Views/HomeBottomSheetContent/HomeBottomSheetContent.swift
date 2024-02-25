//
//  Base.swift
//  HomeBottomSheetContent
//
//  Created by 지준용 on 2/13/24.
//

import SwiftUI

import DesignSystem
import Entity


public struct HomeBottomSheetContent: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel = HomeBottomSheetContentViewModel()
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Views
    public var body: some View {
        BaseView {
            HomeBottomSheetContentHeader(viewModel: viewModel)
        } content: {
            HomeBottomSheetContentList(viewModel: viewModel)
        }
        .onAppear {
            viewModel.selectFilter(index: 0)
        }
    }
}
