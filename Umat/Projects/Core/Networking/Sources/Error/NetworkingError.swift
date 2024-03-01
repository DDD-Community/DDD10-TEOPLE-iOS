//
//  NetworkingError.swift
//  Networking
//
//  Created by Gordon Choi on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public enum NetworkingError: Error, LocalizedError {
    case unknownError
    
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
    
    public var recoverySuggestion: String? { nil }
}
