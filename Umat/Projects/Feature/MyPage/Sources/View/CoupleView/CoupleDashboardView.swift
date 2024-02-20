//
//  CoupleDashboardView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem
import Entity

struct CoupleDashboardView: View {
    var couple: Couple
    
    var body: some View {
        VStack(spacing: 8) {
            Text("\(couple.anniversary.formatToDay())~ (\(couple.anniversary.spendDays())일)")
                .pretendard(.semiBold14)
                .foregroundStyle(Colors.gray500.color)
            
            HStack(spacing: 8) {
                HStack {
                    Spacer()
                    
                    Text(couple.me.name)
                }
                .frame(maxWidth: .infinity)
                
                Image.icons(.ic_heart_filled)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color(hex: "#F43F5E"))
                
                HStack {
                    Text(couple.you.name)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .pretendard(.semiBold16)
        }
    }
}
