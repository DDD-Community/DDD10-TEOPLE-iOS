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
        // TODO: 세팅 화면으로 넘어가야 합니다
        CoupleDashboardView(couple: $couple)
    }
}

#Preview {
    MeAndYouView(couple: .constant(Couple.example))
}
