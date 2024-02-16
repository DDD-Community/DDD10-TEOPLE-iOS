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
    public private(set) var birthday: Date
    public private(set) var wishlist: [Place]
    
    public init(id: String, name: String, birthday: Date, wishlist: [Place]) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.wishlist = wishlist
    }
    
    public mutating func changeName(name newName: String) {
        name = newName
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func changeBirthday(date newBirthday: Date) {
        birthday = newBirthday
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func addPlace(place: Place) {
        wishlist.append(place)
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
    
    public mutating func deletePlace(place: Place) {
        wishlist = wishlist.filter { $0 != place }
        // TODO: 서버에 반영하는 과정도 필요합니다 (feature 단에서 수행할 가능성이 높습니다)
    }
}
