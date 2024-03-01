//
//  PlaceDTO.swift
//  Networking
//
//  Created by Gordon Choi on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

import Entity

public struct PlaceResponse: Decodable {
    let candidates: [PlaceDTO]
}

public struct PlaceDTO: Codable {
    let id: String
    let name: String
    let address: String
    let geometry: PlaceGeometry
    let rating: Double
    let photos: [PlacePhotoInfo]
    
    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case name
        case address = "formatted_address"
        case geometry
        case rating
        case photos
    }
    
    // 모델로 변환하는 함수
}

public struct PlacePhotoInfo: Codable {
    let reference: String
    let width: Double
    let height: Double
    
    enum CodingKeys: String, CodingKey {
        case width, height
        case reference = "photo_reference"
    }
}

public struct PlaceGeometry: Codable {
    let location: PlaceGeometryCoordinate
}

public struct PlaceGeometryCoordinate: Codable {
    let lat: Double
    let lng: Double
}
