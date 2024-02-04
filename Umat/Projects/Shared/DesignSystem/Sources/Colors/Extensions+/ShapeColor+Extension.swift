//
//  Color.swift
//  DesignSystem
//
//  Created by 지준용 on 2/3/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    static func colors(_ color: Colors) -> Color {
        return .init(hex: color.hex)
    }
    
    static func gradient(leading: Colors = .orange400, trailing: Colors = .blue300) -> LinearGradient {
        return .init(gradient: Gradient(colors: [.colors(leading), .colors(trailing)]),
                     startPoint: .leading,
                     endPoint: .trailing)
    }
}
