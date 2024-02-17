//
//  Date+Formatter.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

extension Date {
    func formatToDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: self)
    }
    
    func spendDays() -> String {
        let startDate = self
        let calendar = Calendar.current
        let spendDays = calendar.dateComponents([.day], from: startDate, to: Date()).day
        
        return String(spendDays ?? 10)
    }
}
