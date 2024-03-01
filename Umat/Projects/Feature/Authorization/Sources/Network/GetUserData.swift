//
//  GetUserData.swift
//  Authorization
//
//  Created by 서원지 on 3/1/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

// MARK: - Welcome
public struct GetUserData: Codable {
    let code, message: String?
    let data: GetUserDataResponse?
    
    public init(
        code: String?,
        message: String?,
        data: GetUserDataResponse?) {
        self.code = code
        self.message = message
        self.data = data
    }
    
}

// MARK: - DataClass
public struct GetUserDataResponse: Codable {
    let coupleID, anniversary: String?
    let myInfo, yourInfo: Info?
    let myMap, yourMap, togetherMap: [MapData]?
    let myMapCnt, yourMapCnt, togetherMapCnt, dday: Int?

    enum CodingKeys: String, CodingKey {
        case coupleID = "coupleId"
        case anniversary, myInfo, yourInfo, myMap, yourMap, togetherMap, myMapCnt, yourMapCnt, togetherMapCnt, dday
    }
    
    public init(
        coupleID: String?,
        anniversary: String?,
        myInfo: Info?, yourInfo: Info?,
        myMap: [MapData]?, yourMap: [MapData]?,
        togetherMap: [MapData]?,
        myMapCnt: Int?,
        yourMapCnt: Int?, 
        togetherMapCnt: Int?,
        dday: Int?) {
        self.coupleID = coupleID
        self.anniversary = anniversary
        self.myInfo = myInfo
        self.yourInfo = yourInfo
        self.myMap = myMap
        self.yourMap = yourMap
        self.togetherMap = togetherMap
        self.myMapCnt = myMapCnt
        self.yourMapCnt = yourMapCnt
        self.togetherMapCnt = togetherMapCnt
        self.dday = dday
    }
    
}

// MARK: - Info
public struct Info: Codable {
    let userID, nickName, birth: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickName, birth
    }
    
    public init(
        userID: String?,
        nickName: String?,
        birth: String?) {
        self.userID = userID
        self.nickName = nickName
        self.birth = birth
    }
}

// MARK: - Map
public struct MapData: Codable {
    let mapID, thirdMapID: String?
    let latitude, longitude: Int?

    enum CodingKeys: String, CodingKey {
        case mapID = "mapId"
        case thirdMapID = "thirdMapId"
        case latitude, longitude
    }
    
    public init(
        mapID: String?,
        thirdMapID: String?,
        latitude: Int?,
        longitude: Int?) {
        self.mapID = mapID
        self.thirdMapID = thirdMapID
        self.latitude = latitude
        self.longitude = longitude
    }
}

