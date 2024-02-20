//
//  ConfigView.swift
//  MyPage
//
//  Created by Gordon Choi on 2/17/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct ConfigView: View {
    public var body: some View {
        NavigationStack {
            List {
                ForEach(ConfigItems.allCases, id: \.self) { item in
                    NavigationLink(destination: Text(item.rawValue)) {
                        Text(item.rawValue)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("환경설정")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    public init() { }
}

enum ConfigItems: String, CaseIterable {
    case versionInfo = "버전 정보"
    case termsOfUse = "이용 약관"
    case logout = "로그아웃"
    case connect = "커플 연결"
}

