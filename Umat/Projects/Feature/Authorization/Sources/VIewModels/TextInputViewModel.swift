//
//  TextInputViewModel.swift
//  Authorization
//
//  Created by 지준용 on 2/15/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import DesignSystem

public final class TextInputViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var text: String = ""
    @Published var supportingText: String = ""
    @Published var stateColor: Color? = nil
    @Published var focusState: Bool = false
    @Published var isEnabled: Bool = false
    @Published var coupleData: CoupleData?
    private let networkManager: NetworkManager
    
    // MARK: - Init
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    // MARK: - Methods
    func signUpUser(completion: @escaping (CoupleData?) -> ()) {
        Task {
            await networkManager.signUpUsers(nickName: text) { data in
                completion(data)
            }
        }
    }
}
