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
        CoupleDashboardView(couple: $couple)
    }
}
