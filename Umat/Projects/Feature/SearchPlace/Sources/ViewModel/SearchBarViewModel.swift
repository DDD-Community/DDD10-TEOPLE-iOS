//
//  SearchBarViewModel.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Combine
import Foundation

import Utility

public final class SearchBarViewModel: ObservableObject {
    // MARK: - Properties
    private let searchPlaceUseCase: SearchPlaceUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - init
    public init(searchPlaceUseCase: SearchPlaceUseCase = SearchPlaceUseCaseImpl()) {
        self.searchPlaceUseCase = searchPlaceUseCase
    }
    
    // MARK: - Methods
    func searchKeyword(_ keyword: String) {
        // TODO: 현재는 결과값을 print하게만 해 둔 상태. 실질적인 로직에 연결되도록 작업을 수행할 것
        searchPlaceUseCase.searchKeyword(keyword)
            .sink { completion in
                Logger.print(completion)
            } receiveValue: { value in
                Logger.print(value)
            }
            .store(in: &cancellables)
    }
}
