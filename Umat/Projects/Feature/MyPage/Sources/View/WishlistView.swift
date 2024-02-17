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
        HStack(spacing: 12) {
            VStack {
                Text("내가")
                Text("가고 싶은 곳")
                Text("\(couple.me.wishlist.count)개")
            }
            
            HorizontalDividingLine()
            
            VStack {
                Text("우리 함께")
                Text("가고 싶은 곳")
                Text("\(couple.wishlist.count)개")
            }
            
            HorizontalDividingLine()
            
            VStack {
                Text("네가")
                Text("가고 싶은 곳")
                Text("\(couple.you.wishlist.count)개")
            }
        }
        .frame(height: 327)
        .frame(maxWidth: .infinity)
        .background(Colors.gray100.color)
    }
}

#Preview {
    WishlistView(couple: .constant(Couple.example))
}
