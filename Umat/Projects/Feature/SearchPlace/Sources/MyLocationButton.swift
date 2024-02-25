//
//  MyLocationButton.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/25/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem
import Utility

struct MyLocationButton: View {
    // MARK: - Properties
    private var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image.icons(.ic_current_location_outlined)
                .frame(width: 24, height: 24)
        }
        .frame(width: 46, height: 46)
    }
    
    // MARK: - init
    init(action: @escaping () -> Void) {
        self.action = action
    }
}
