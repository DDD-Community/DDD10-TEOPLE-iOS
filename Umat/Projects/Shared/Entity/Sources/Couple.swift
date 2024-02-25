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
public struct Couple {
    private let id: String
    public var me: UserInfo
    public let you: UserInfo
    public private(set) var anniversary: Date
    
    public var wishlist: [Place] {
        me.wishlist.filter { you.wishlist.contains($0) }
    }
    
    public init(id: String, me: UserInfo, you: UserInfo, anniversary: Date) {
        self.id = id
        self.me = me
        self.you = you
        self.anniversary = anniversary
    }
    
    public mutating func changeMyInfo(me newInfo: UserInfo) {
        me = newInfo
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func changeAnniversary(anniversary newDate: Date) {
        anniversary = newDate
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
}

public extension Couple {
    // 예시 날짜를 개발팀에 의미있는 날짜로 바꾸는 것 정도 생각해 봅시다
    /// 커플 예시 데이터입니다.
    static var example = Couple(
        id: "Hello",
        me: UserInfo.exampleMe,
        you: UserInfo.exampleYou,
        anniversary: Date()
    )
}
