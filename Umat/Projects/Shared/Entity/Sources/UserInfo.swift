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

public extension UserInfo {
    /// "나" 예시 데이터입니다.
    static let exampleMe = UserInfo(id: "ME",
                                    name: "주은주은주은",
                                    birthday: Date(),
                                    wishlist: [.init(name: "San Francisco",
                                                     address: "서울시 용산구 한남동 738-20",
                                                     openingHour: "오전 10:30",
                                                     closingHour: "오후 8:30",
                                                     grade: 0,
                                                     latitude: 37.7562,
                                                     longitude: -122.443,
                                                     imageURL: nil),
                                               .init(name: "서울",
                                                     address: "서울시 용산구 한남동 738-20",
                                                     openingHour: "오전 10:30",
                                                     closingHour: "오후 8:30",
                                                     grade: 0,
                                                     latitude: 37.5833,
                                                     longitude: 127,
                                                     imageURL: URL(string: "https://picsum.photos/200")),
                                               .init(name: "Osaka",
                                                     address: "서울시 용산구 한남동 738-20",
                                                     openingHour: "오전 10:30",
                                                     closingHour: "오후 8:30",
                                                     grade: 0,
                                                     latitude: 34.6936,
                                                     longitude: 135.502,
                                                     imageURL: URL(string: "https://picsum.photos/200")),])
    /// "너" 예시 데이터입니다.
    static let exampleYou = UserInfo(id: "YOU",
                                     name: "지훈지훈지훈",
                                     birthday: Date(),
                                     wishlist: [.init(name: "부산",
                                                      address: "서울시 용산구 한남동 738-20",
                                                      openingHour: "오전 10:30",
                                                      closingHour: "오후 8:30",
                                                      grade: 0,
                                                      latitude: 35.1,
                                                      longitude: 129.04,
                                                      imageURL: URL(string: "https://picsum.photos/200")),
                                                .init(name: "인천",
                                                      address: "서울시 용산구 한남동 738-20",
                                                      openingHour: "오전 10:30",
                                                      closingHour: "오후 8:30",
                                                      grade: 0,
                                                      latitude: 37.4639,
                                                      longitude: 126.649,
                                                      imageURL: URL(string: "https://picsum.photos/200")),
                                                .init(name: "제주",
                                                      address: "서울시 용산구 한남동 738-20",
                                                      openingHour: "오전 10:30",
                                                      closingHour: "오후 8:30",
                                                      grade: 0,
                                                      latitude: 0,
                                                      longitude: 0,
                                                      imageURL: URL(string: "https://picsum.photos/200")),
                                                .init(name: "서울",
                                                      address: "서울시 용산구 한남동 738-20",
                                                      openingHour: "오전 10:30",
                                                      closingHour: "오후 8:30",
                                                      grade: 0,
                                                      latitude: 37.5833,
                                                      longitude: 127,
                                                      imageURL: URL(string: "https://picsum.photos/200"))])
}
