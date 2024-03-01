//
//  NetworkManager.swift
//  Authorization
//
//  Created by 지준용 on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation
import Combine

import Moya
import CombineMoya

import Utility


public final class NetworkManager: ObservableObject {
    
    // MARK: Properties
    private let loginProvider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    private var cancellable: AnyCancellable?
    
    @Published var coupleData: CoupleData?
    @Published var getUserData: GetUserData?
    
    // MARK: - Init
    public init() {
        
    }
    
    // MARK: - Get
    func getUser(accessToken: String) {
        if let cancellable = cancellable {
            cancellable.cancel()
        }
        
        
        cancellable = loginProvider.requestWithProgressPublisher(.getUser(accessToken: accessToken))
            .compactMap{$0.response?.data}
            .receive(on: DispatchQueue.main)
            .decode(type: GetUserData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    Log.network("네트워크 에러", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                switch data.message {
                case "Success":
                    self?.geUserToModel(data)
                    Log.network("getAuth: 데이터", data)
                default:
                    self?.geUserToModel(data)
                    Log.network("getAuth: 데이터 에러", data)
                }
            })
        
//        loginProvider.request(.getUser(accessToken: accessToken)) { result in
//            switch result {
//            case .success(let data):
//                Logger.print(data.response)
//            case .failure(let error):
//                Logger.print(error.localizedDescription)
//            }
//        }
    }
    
    private func geUserToModel(_ data: GetUserData){
        self.getUserData = data
    }
    
    func getAuth(accessToken: String) async {
        if let cancellable = cancellable {
            cancellable.cancel()
        }
        
        cancellable = loginProvider.requestWithProgressPublisher(.getAuth(accessToken: accessToken))
            .compactMap{$0.response?.data}
            .receive(on: DispatchQueue.main)
            .decode(type: CoupleData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    Log.network("네트워크 에러", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                switch data.message {
                case "Success":
                    self?.signUpUserToModel(data)
                    Log.network("getAuth: 데이터", data)
                default:
                    self?.signUpUserToModel(data)
                    Log.network("getAuth: 데이터 에러", data)
                }
            })
    
        
//        loginProvider.request(.getAuth(accessToken: accessToken)) { result in
//            switch result {
//            case .success(let result):
//                // TODO: 전달받은 데이터(coupleID, userID)가 있으면 로그인절차 무시하고 넘어감
//                print(result)
//            case .failure(let error):
//                Logger.print(error.localizedDescription)
//            }
//        }
    }
    
    // MARK: - Post
    
    //MARK: - 데이터를 모델에게 전송
    private func signUpUserToModel(_ data: CoupleData){
        self.coupleData = data
    }
    
    func signUpUsers(nickName: String,
                     birth: String? = nil,
                     anniversary: String? = nil,
                     coupleCode: String = "",
                     completion: @escaping (CoupleData) -> Void) async {
        
        if let cancellable = cancellable {
            cancellable.cancel()
        }
        let defaultDate = "\(Date().formatToRequestDay())"
       cancellable = loginProvider.requestWithProgressPublisher(.signUpUser(
            nickName: nickName,
            birth: birth ?? "\(defaultDate)",
            anniversary: anniversary ?? "\(defaultDate)",
            coupleCode: coupleCode))
        .compactMap{$0.response?.data}
        .receive(on: DispatchQueue.main)
        .decode(type: CoupleData.self, decoder: JSONDecoder())
        //MARK: - 나중에 로딩 중 이런거 하실떄 사용하면 되욧
//        .handleEvents(receiveSubscription: { [weak self] _ in
//
//        })
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                Log.network("네트워크 에러", error.localizedDescription)
            }
        }, receiveValue: { [weak self] data in
            switch data.message {
            case "Success":
                self?.signUpUserToModel(data)
                Log.network("couple data: 데이터", data)
                completion(data)
            default:
                self?.signUpUserToModel(data)
                Log.network("couple data: 데이터 에러", data)
                completion(data)
            }
            
        })
    }
    
    
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
