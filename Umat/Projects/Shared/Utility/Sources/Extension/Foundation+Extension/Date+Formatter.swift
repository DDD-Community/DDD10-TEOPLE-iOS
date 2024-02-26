//
//  Date+Formatter.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public extension Date {
    /// 년, 월, 일 단위로 날짜를 포매팅하는 메서드입니다.
    func formatToDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: self)
    }
    
    func formatToWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        return formatter.string(from: self)
    }
    
    /// 정해진 날짜로부터 오늘까지의 날짜를 계산하는 메서드입니다.
    func spendDays() -> String {
        let startDate = self
        let calendar = Calendar.current
        guard let spendDays = calendar.dateComponents([.day], from: startDate, to: Date()).day else {
            return "NaN"
        }
        
        return String(spendDays + 1)
    }
}
