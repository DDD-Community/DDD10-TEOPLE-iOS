import Combine
import Foundation

import Entity
import Networking

public protocol SearchPlaceUseCase {
    func searchKeyword(_ keyword: String) -> AnyPublisher<String, Error>
    func searchPlace(_ place: Place)
}

public final class SearchPlaceUseCaseImpl: SearchPlaceUseCase {
    private let webService: WebServiceable
    
    public init(webService: WebServiceable = WebService()) {
        self.webService = webService
    }
    
    // TODO: 검색 결과 Entity 지정해서 디코딩 작업 수행
    public func searchKeyword(_ keyword: String) -> AnyPublisher<String, Error> {
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
    
    public func searchPlace(_ place: Place) {
        
    }
}
