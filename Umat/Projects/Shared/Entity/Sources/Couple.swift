//
//  Couple.swift
//  Entity
//
//  Created by Gordon Choi on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

/// 커플을 위한 모델입니다.
/// 나의 정보 및 기념일을 바꾸었을 때 반영할 수 있도록 var로 했습니다.
/// id나 you의 정보는 내가 임의로 바꿀 수 없도록 let으로 지정했습니다.
/// 이 부분은 백엔드 단에서 내려줄 때만 새로운 객체로 수정하면 됩니다.
struct Couple {
    private let id: String
    public private(set) var me: UserInfo
    public let you: UserInfo
    public private(set) var anniversary: Date
    public private(set) var wishlist: [Place]
    
    public init(id: String, me: UserInfo, you: UserInfo, anniversary: Date, wishlist: [Place]) {
        self.id = id
        self.me = me
        self.you = you
        self.anniversary = anniversary
        self.wishlist = wishlist
    }
    
    public mutating func changeMyInfo(me newInfo: UserInfo) {
        me = newInfo
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func changeAnniversary(anniversary newDate: Date) {
        anniversary = newDate
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    // TODO: "우리" 리스트에 채워넣거나 삭제하는 메서드
    // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
}
