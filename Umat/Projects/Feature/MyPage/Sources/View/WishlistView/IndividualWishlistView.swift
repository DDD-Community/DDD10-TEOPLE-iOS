//
//  IndividualWishlistView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem

struct IndividualWishlistView: View {
    var identity: Identity
    var wishlists: Int
    
    var body: some View {
        VStack(spacing: 2) {
            VStack(spacing: 0) {
                Text(identity.rawValue)
                
                Text("가고 싶은 곳")
            }
            .lineSeedSans(.bold12)
            .foregroundStyle(Colors.gray500.color)
            
            Text("\(wishlists)개")
                .lineSeedSans(.bold16 )
        }
    }
}

enum Identity: String {
    case me = "내가"
    case you = "네가"
    case we = "우리 함께"
}

#Preview {
    IndividualWishlistView(identity: .me, wishlists: 30)
}
