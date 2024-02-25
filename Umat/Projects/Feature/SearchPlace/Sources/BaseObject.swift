import Foundation

import Entity

public protocol SearchPlaceUseCase {
    func searchKeyword(_ keyword: String)
    func searchPlace(_ place: Place)
}

public final class SearchPlaceUseCaseImpl: SearchPlaceUseCase {
    public func searchKeyword(_ keyword: String) {
        
    }
    
    public func searchPlace(_ place: Place) {
        
    }
}
