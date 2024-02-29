//
//  SearchPlaceRepository.swift
//  Networking
//
//  Created by Gordon Choi on 2/29/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Combine
import Foundation

import Entity

public protocol SearchPlaceRepository {
    func searchKeyword(_ keyword: String) -> AnyPublisher<Place, NetworkingError>
}

public final class SearchPlaceRepositoryImpl: SearchPlaceRepository {
    private let webService: WebServiceable
    
    public init(webService: WebServiceable = WebService()) {
        self.webService = webService
    }
    
    public func searchKeyword(_ keyword: String) -> AnyPublisher<Place, NetworkingError> {
        webService.call(service: .searchPlace(keyword))
            .tryMap {
                let str = String(data: $0.data, encoding: .utf8) ?? "DECODING FAILED"
                return str
            }
            .mapError { error in
                return error as Error
            }
            .eraseToAnyPublisher()
    }
}

