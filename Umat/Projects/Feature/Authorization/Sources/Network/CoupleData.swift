//
//  CoupleData.swift
//  Authorization
//
//  Created by 지준용 on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

import Foundation

// MARK: - Welcome
public struct CoupleData: Codable {
    let code, message: String?
    let data: CoupleDataResponse?
    
    public init(code: String?, message: String?, data: CoupleDataResponse?) {
        self.code = code
        self.message = message
        self.data = data
    }
}

// MARK: - DataClass
public struct CoupleDataResponse: Codable {
    let coupleID, userID, coupleCode, accessToken: String?

    enum CodingKeys: String, CodingKey {
        case coupleID = "coupleId"
        case userID = "userId"
        case coupleCode, accessToken
    }
    
    public init(
        coupleID: String?,
        userID: String?,
        coupleCode: String?,
        accessToken: String?) {
        self.coupleID = coupleID
        self.userID = userID
        self.coupleCode = coupleCode
        self.accessToken = accessToken
    }
}
