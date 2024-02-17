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
    @Binding var couple: Couple
    
    var body: some View {
        VStack(spacing: 16) {
            // TODO: ic_profile_user 아이콘을 써야 합니다
            Image.icons(.ic_pin)
                .resizable()
                .renderingMode(.template)
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fill)
                .foregroundStyle(Colors.orange500.color)
            
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
}

#Preview {
    CoupleDashboardView(couple: .constant(Couple.example))
}
