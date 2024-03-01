//
//  Place.swift
//  Entity
//
//  Created by Gordon Choi on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

/// 장소 모델입니다.
/// 구글 장소 api에 요청한 결과를 토대로 가져옵니다.
/// CoreLocation을 아직 사용하지 않습니다. 임시로 위치 타입을 정해 두었습니다.
public struct Place: Hashable, Codable {
    public let id: String
    public let name: String
    public let address: String
    public let openingHour: String
    public let closingHour: String
    public let grade: Double
    public let location: Location
    public let imageURL: URL?
    // TODO: 요일에 대한 정보 필요
    
    public struct Location: Hashable, Codable {
        public let latitude: Double
        public let longitude: Double
    }
    
    public init(id: String,
                name: String,
                address: String,
                openingHour: String,
                closingHour: String,
                grade: Double,
                latitude: Double,
                longitude: Double,
                imageURL: URL?) {
        self.id = id
        self.name = name
        self.address = address
        self.openingHour = openingHour
        self.closingHour = closingHour
        self.grade = grade
        self.location = Location(latitude: latitude, longitude: longitude)
        self.imageURL = imageURL
    }
}

public extension Place {
    static let example = Place(id: "Hello",
                               name: "블루도어북스",
                               address: "서울시 용산구 한남동 738-20",
                               openingHour: "오후 12:30",
                               closingHour: "오후 10:00",
                               grade: 3.5,
                               latitude: 0,
                               longitude: 0,
                               imageURL: nil)
}
