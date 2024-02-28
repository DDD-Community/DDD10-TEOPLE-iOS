//
//  WebService.swift
//  Networking
//
//  Created by Gordon Choi on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Combine
import Foundation

import CombineMoya
import Moya

public struct WebService {
    private let provider = MoyaProvider<APIService>()
    
    public init() { }
    
    public func call(_ quote: String) -> AnyPublisher<String, MoyaError> {
        return provider.requestPublisher(.searchPlace(quote))
            .filter(statusCode: 200)
            .map {
                // TODO: 모델에 의거한 디코딩 작업 수행
                return String(data: $0.data, encoding: .utf8) ?? "DECODING ERROR"
            }
            .eraseToAnyPublisher()
    }
}
