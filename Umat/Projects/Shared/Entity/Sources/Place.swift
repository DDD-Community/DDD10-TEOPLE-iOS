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
public struct Place {
    public let name: String
    public let openingHour: String
    public let closingHour: String
    public let grade: Double
    public let location: Location
    
    public struct Location {
        public let latitude: Double
        public let longitude: Double
    }
    
    public init(name: String, openingHour: String, closingHour: String, grade: Double, latitude: Double, longitude: Double) {
        self.name = name
        self.openingHour = openingHour
        self.closingHour = closingHour
        self.grade = grade
        self.location = Location(latitude: latitude, longitude: longitude)
    }
}
