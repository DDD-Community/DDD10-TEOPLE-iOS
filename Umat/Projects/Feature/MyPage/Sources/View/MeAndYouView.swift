//
//  MeAndYouView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/16/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import Entity

struct MeAndYouView: View {
    @Binding var couple: Couple
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "heart.fill")
            
            Text("\(couple.anniversary)~")
            
            HStack(spacing: 8) {
                Text(couple.me.name)
                
                Image(systemName: "heart")
                
                Text(couple.you.name)
            }
        }
    }
}

#Preview {
    MeAndYouView(couple: .constant(Couple.example))
}
