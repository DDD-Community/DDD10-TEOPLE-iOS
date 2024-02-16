//
//  TextInputViewModel.swift
//  Authorization
//
//  Created by 지준용 on 2/15/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public final class TextInputViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var supportingText: String = ""
    @Published var stateColor: Color? = nil
    @Published var focusState: Bool = false
    @Published var isEnabled: Bool = false
}
