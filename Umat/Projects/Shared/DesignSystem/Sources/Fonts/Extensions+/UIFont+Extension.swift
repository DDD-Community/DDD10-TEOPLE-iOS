//
//  UIFont+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 1/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - UIFont Custom
extension UIFont {
    static func pretendard(_ font: Pretendard, size: CGFloat) -> UIFont {
        return .init(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
    static func lineSeedSans(_ font: LINESeedSans, size: CGFloat) -> UIFont {
        return .init(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
