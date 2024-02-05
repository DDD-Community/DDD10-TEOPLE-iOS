//
//  Image+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/4/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public extension Image {
    static func icons(_ icon: Icons) -> Image {
        return .init(icon.rawValue, bundle: .module)
    }
}
