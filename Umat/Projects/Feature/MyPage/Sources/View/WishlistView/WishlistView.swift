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
    // MARK: - Stored properties
    private var couple: Couple
    
    // MARK: - Computed properties
    var body: some View {
        HStack(spacing: 24) {
            IndividualWishlistView(identity: .me, wishlists: couple.me.wishlist.count)
                .frame(maxWidth: .infinity)
            
            VerticalDividingLine()
            
            IndividualWishlistView(identity: .we, wishlists: couple.wishlist.count)
                .frame(maxWidth: .infinity)
            
            VerticalDividingLine()
            
            IndividualWishlistView(identity: .you, wishlists: couple.you.wishlist.count)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 327)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .background(Colors.gray100.color)
    }
    
    // MARK: - init
    public init(couple: Couple) {
        self.couple = couple
    }
}

