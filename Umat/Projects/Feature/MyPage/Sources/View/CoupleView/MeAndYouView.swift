//
//  MeAndYouView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/16/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import DesignSystem
import Entity

struct MeAndYouView: View {
    // MARK: - Stored properties
    private var couple: Couple
    @Binding var editProfileIsPresented: Bool
    
    // MARK: - Computed properties
    var body: some View {
        VStack(spacing: 16) {
            // TODO: ic_profile_user 아이콘을 써야 합니다
            ZStack {
                Image.icons(.ic_pin)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(Colors.orange500.color)
                
                HStack {
                    Spacer()
                    
                    Button {
                        editProfileIsPresented = true
                    } label: {
                        Image.icons(.ic_arrow_forward_filled)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.trailing, 24)
                    }
                }
            }
            
            CoupleDashboardView(couple: couple)
        }
    }
    
    // MARK: - init
    public init(couple: Couple, editProfileIsPresented: Binding<Bool>) {
        self.couple = couple
        self._editProfileIsPresented = editProfileIsPresented
    }
}
