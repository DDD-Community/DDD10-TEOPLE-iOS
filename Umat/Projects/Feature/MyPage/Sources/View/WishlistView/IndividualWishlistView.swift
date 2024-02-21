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
    // MARK: - Stored properties
    private var identity: Identity
    private var wishlists: Int
    
    // MARK: Computed properties
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
    
    public init(identity: Identity, wishlists: Int) {
        self.identity = identity
        self.wishlists = wishlists
    }
}

enum Identity: String {
    case me = "내가"
    case you = "네가"
    case we = "우리 함께"
}
