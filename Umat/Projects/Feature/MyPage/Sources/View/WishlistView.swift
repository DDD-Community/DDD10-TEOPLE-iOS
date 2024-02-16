//
//  WishlistView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/16/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem
import Entity

struct WishlistView: View {
    @Binding var couple: Couple
    
    var body: some View {
        HStack {
            VStack {
                Text("Wishlist me")
                Text("\(couple.me.wishlist.count)개")
            }
            
            // TODO: 하드코딩 값으로 쓸 구분선 같으면 디자인 시스템에 넣는 것도 검토
            Rectangle()
                .foregroundStyle(Colors.gray300.color)
                .frame(width: 2, height: 80)
                .padding([.top, .bottom], 10)
            
            VStack {
                Text("Wishlist we")
                Text("\(couple.wishlist.count)개")
            }
            
            Rectangle()
                .foregroundStyle(Colors.gray300.color)
                .frame(width: 2, height: 80)
                .padding([.top, .bottom], 10)
            
            VStack {
                Text("Wishlist you")
                Text("\(couple.you.wishlist.count)개")
            }
        }
        .padding(8)
        .background(Colors.gray100.color)
        .cornerRadius(8)
    }
}

#Preview {
    WishlistView(couple: .constant(Couple.example))
}
