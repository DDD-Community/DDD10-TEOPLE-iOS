import Combine
import Foundation

import Entity
import Networking

public protocol SearchPlaceUseCase {
//    func searchKeyword(_ keyword: String) -> AnyPublisher<String, Error>
    func searchPlace(_ place: Place)
}

public final class SearchPlaceUseCaseImpl: SearchPlaceUseCase {
    private let repository: SearchPlaceRepository
    
    public init(repository: SearchPlaceRepository = SearchPlaceRepositoryImpl()) {
        self.repository = repository
    }
    
//    // TODO: 검색 결과 Entity 지정해서 디코딩 작업 수행
//    public func searchKeyword(_ keyword: String) -> AnyPublisher<String, Error> {
//        repository.searchKeyword(.searchPlace(keyword))
//    }
    
    public func searchPlace(_ place: Place) {
        
    }
}
