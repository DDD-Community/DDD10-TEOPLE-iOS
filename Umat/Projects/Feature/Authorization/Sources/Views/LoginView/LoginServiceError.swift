//
//  LoginServiceError.swift
//  Authorization
//
//  Created by 지준용 on 2/27/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation


enum LoginServiceError: Error, CustomDebugStringConvertible {
    case credentialNotFound
    case tokenNotFound
    
    var debugDescription: String {
        switch self {
        case .credentialNotFound:
            return "인증정보를 찾을 수 없습니다."
        case .tokenNotFound:
            return "토큰정보를 찾을 수 없습니다."
        }
    }
}
