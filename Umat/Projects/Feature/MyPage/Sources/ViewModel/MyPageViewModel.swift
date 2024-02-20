//
//  MyPageViewModel.swift
//  MyPage
//
//  Created by Gordon Choi on 2/16/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Combine
import Foundation

import Entity

public final class MyPageViewModel: ObservableObject {
    @Published public var couple: Couple = Couple.example
    
    public init() { }
}
