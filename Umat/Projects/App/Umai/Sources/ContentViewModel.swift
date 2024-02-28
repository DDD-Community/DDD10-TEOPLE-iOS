//
//  ContentViewModel.swift
//  Umai
//
//  Created by Gordon Choi on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Combine
import Foundation

import Networking

final class ContentViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let webService = WebService()
    
    func call(quote: String) {
        webService.call(quote)
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else { return }
                
                print(error)
            }) { response in
                print(response)
            }
            .store(in: &cancellables)
    }
}

