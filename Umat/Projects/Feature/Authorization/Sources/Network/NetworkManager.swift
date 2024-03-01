//
//  NetworkManager.swift
//  Authorization
//
//  Created by 지준용 on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation
import Moya

import Utility


public final class NetworkManager {
    
    // MARK: Properties
    private let loginProvider = MoyaProvider<UserTarget>()
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Get
    func getUser(accessToken: String) {
        loginProvider.request(.getUser(accessToken: accessToken)) { result in
            switch result {
            case .success(let data):
                Logger.print(data.response)
            case .failure(let error):
                Logger.print(error.localizedDescription)
            }
        }
    }
    
    func getAuth(accessToken: String) {
        loginProvider.request(.getAuth(accessToken: accessToken)) { result in
            switch result {
            case .success(let result):
                // TODO: 전달받은 데이터(coupleID, userID)가 있으면 로그인절차 무시하고 넘어감
                print(result)
            case .failure(let error):
                Logger.print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Post
    // TODO: 얘는 커플코드쪽으로 가야함.
    func signUpUser(nickName: String, 
                    birth: String? = nil, 
                    anniversary: String? = nil,
                    coupleCode: String = "",
                    completion: @escaping (CoupleData) -> Void) {
        
        let defaultDate = "\(Date().formatToRequestDay())"
        loginProvider.request(.signUpUser(nickName: nickName,
                                          birth: birth ?? "\(defaultDate)",
                                          anniversary: anniversary ?? "\(defaultDate)",
                                          coupleCode: coupleCode)) { result in
            switch result {
            case .success(let response):
                // TODO: 회원가입할 때
                
                do {
                    let data = try JSONDecoder().decode(CoupleData.self, from: response.data)
                    
                    DispatchQueue.main.async {
                        completion(data)
                    }
                } catch {
                    print("error")
                }
                
            case .failure(let error):
                Logger.print(error.localizedDescription)
            }
        }
    }
}
