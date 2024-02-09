//
//  String+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/7/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

extension String {
    func isKoreanLanguage() -> Bool {
        let arr = Array(self)
        
        let pattern = "^[가-힣ㄱ-ㅎㅏ-ㅣ]$"
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
            var index = 0
            
            while index < arr.count {
                let results = regex.matches(in: String(arr[index]), options: [], range: NSRange(location: 0, length: 1))
                if results.count == 0 {
                    return false
                } else {
                    index += 1
                }
            }
        }
        return true
    }
}
