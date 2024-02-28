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

public protocol WebServiceable {
    // TODO: 커스텀 에러로 바꾸기
    func call(service: APIService) -> AnyPublisher<Response, MoyaError>
}

public struct WebService: WebServiceable {
    private let provider = MoyaProvider<APIService>()
    
    public init() { }
    
    public func call(service: APIService) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(service)
    }
}
