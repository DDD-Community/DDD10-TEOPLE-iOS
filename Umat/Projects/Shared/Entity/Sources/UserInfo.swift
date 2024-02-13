//
//  UserInfo.swift
//  Entity
//
//  Created by Gordon Choi on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

/// 사용자 한 명에 대한 정보입니다.
/// id값은 바뀌면 안 되므로 let입니다.
/// 이름이나 알러지 품목은 바뀔 수 있으므로 var로 하고, 수정 메서드를 작성했습니다.
public struct UserInfo {
    private let id: String
    public private(set) var name: String
    public private(set) var allergicFoods: [AllergicFood]
    
    public init(id: String, name: String, allergicFoods: [AllergicFood]) {
        self.id = id
        self.name = name
        self.allergicFoods = allergicFoods
    }
    
    public mutating func changeName(name newName: String) {
        name = newName
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func changeAllergicFoods(foods newAllergicFoods: [AllergicFood]) {
        allergicFoods = newAllergicFoods
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
}

/// 식약처에서 제공하는 알러지 품목에 관한 목록입니다.
public enum AllergicFood: String, CaseIterable {
    case crab = "게"
    case mackerel = "고등어"
    case oyster = "굴"
    case eggs = "난류"
    case chicken = "닭고기"
    case soybean = "대두"
    case pork = "돼지고기"
    case peanut = "땅콩"
    case buckwheat = "메밀"
    case wheat = "밀"
    case peach = "복숭아"
    case shrimp = "새우"
    case beef = "쇠고기"
    case sulfurousAcids = "아황산 포함 식품"
    case squid = "오징어"
    case milk = "우유"
    case abalone = "전복"
    case shellfishes = "조개류"
    case tomato = "토마토"
    case walnut = "호두"
    case mussel = "홍합"
}
