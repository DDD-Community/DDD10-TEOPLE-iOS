//
//  TextWithColoredSubstring.swift
//  DesignSystem
//
//  Created by 지준용 on 2/23/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct TextWithColoredSubstring: View {
    private var originalText: String
    private var coloredSubstring: String
    private var originalColor: Color
    private var substringColor: Color
    
    public init(originalText: String, coloredSubstring: String, originalColor: Color, substringColor: Color) {
        self.originalText = originalText
        self.coloredSubstring = coloredSubstring
        self.originalColor = originalColor
        self.substringColor = substringColor
    }
    
    public var body: some View {
        if let coloredRange = originalText.range(of: coloredSubstring) {
            let beforeRange = originalText[..<coloredRange.lowerBound]
            let coloredText = originalText[coloredRange]
            let afterRange = originalText[coloredRange.upperBound...]
            
            return Text(beforeRange)
                .foregroundColor(originalColor)
                + Text(coloredText)
                    .foregroundColor(substringColor)
                + Text(afterRange)
                    .foregroundColor(originalColor)
        } else {
            return Text(originalText)
                .foregroundColor(originalColor)
        }
    }
}
