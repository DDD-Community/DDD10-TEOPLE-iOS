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
            IndividualWishlistView(identity: .me, wishlists: couple.me.wishlist.count)
                .frame(maxWidth: .infinity)
                .padding(.leading, 24)
            
            HorizontalDividingLine()
            
            IndividualWishlistView(identity: .we, wishlists: couple.wishlist.count)
                .frame(maxWidth: .infinity)
            
            HorizontalDividingLine()
            
            IndividualWishlistView(identity: .you, wishlists: couple.you.wishlist.count)
                .frame(maxWidth: .infinity)
                .padding(.trailing, 24)
        }
        .frame(height: 327)
        .frame(maxWidth: .infinity)
        .background(Colors.gray100.color)
    }
}

#Preview {
    WishlistView(couple: .constant(Couple.example))
}
