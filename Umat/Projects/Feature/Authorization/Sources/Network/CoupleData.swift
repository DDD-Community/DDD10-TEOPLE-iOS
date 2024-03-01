//
//  CoupleData.swift
//  Authorization
//
//  Created by 지준용 on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public struct CoupleData: Codable {
    let coupleId: String
    let userId: String
    let coupleCode: String
    let accessToken: String
}
