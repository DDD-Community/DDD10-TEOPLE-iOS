//
//  UserInfo.swift
//  Entity
//
//  Created by Gordon Choi on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

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
    }
    
    public mutating func changeAllergicFoods(foods newAllergicFoods: [AllergicFood]) {
        allergicFoods = newAllergicFoods
    }
}

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
