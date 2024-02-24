//
//  BottomSheetViewModel.swift
//  DesignSystem
//
//  Created by 지준용 on 2/19/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

final class BottomSheetViewModel: ObservableObject {
    
    // MARK: - Enum
    enum Direct {
        case none
        case up
        case down
    }
    
    // MARK: - Properties
    @Published private(set) var offset: CGFloat = 0
    @Published private(set) var direct: Direct = .none
    private(set) var originOffset: CGFloat = 0
    private var isCheckedOriginOffset: Bool = false
    
    // MARK: - Methods
    func setupOriginOffset(_ offset: CGFloat) {
        guard !isCheckedOriginOffset else { return }
        self.originOffset = offset
        self.offset = offset
        isCheckedOriginOffset = true
    }
    
    func setupOffset(_ offset: CGFloat) {
        guard isCheckedOriginOffset else { return }
        self.offset = offset
    }
    
    func setupDirect(_ direct: Direct) {
        guard isCheckedOriginOffset else { return }
        self.direct = direct
    }
}
