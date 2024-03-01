//
//  UserTarget.swift
//  Authorization
//
//  Created by 지준용 on 2/27/24.
//

import Foundation

import Moya


enum UserTarget {
    case getUser(accessToken: String)
    case signUpUser(nickName: String, birth: String, anniversary: String, coupleCode: String)
    case updateUser(nickName: String, birth: String, anniversary: String)
    case getAuth(accessToken: String)
    
    // TODO: 회원 탈퇴, 지도 등
}

enum APIEnvironment {
    static let baseURL = "http://138.2.126.76:8080/"
    static let getUser = "user/me"
    static let signUpUser = "user"
    static let updateUser = "user"
    static let getAuth = "auth/token"
    
    static let headerKey = "Content-Type"
    static let headerValue = "application/json"
}



extension UserTarget: TargetType {
    var baseURL: URL {
        let urlString = APIEnvironment.baseURL
        guard let url = URL(string: urlString) else {
            fatalError("\(urlString) Error")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .getUser:
            return APIEnvironment.getUser
        case .signUpUser:
            return APIEnvironment.signUpUser
        case .updateUser:
            return APIEnvironment.updateUser
        case .getAuth:
            return APIEnvironment.getAuth
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser, .getAuth:
            return .get
        case .signUpUser:
            return .post
        case .updateUser:
            return .patch
        }
    }

    var task: Moya.Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .getAuth(accessToken: let accessToken):
            return .requestParameters(parameters: ["token": accessToken], encoding: URLEncoding.queryString)
        case .signUpUser(nickName: let nickName, birth: let birth, anniversary: let anniversary, coupleCode: let coupleCode):
            return .requestParameters(parameters: ["nickName": nickName, "birth": birth, "anniversary": anniversary, "coupleCode": coupleCode],
                                      encoding: URLEncoding.queryString)
        case .updateUser(nickName: let nickName, birth: let birth, anniversary: let anniversary):
            return .requestParameters(parameters: ["nickName": nickName, "birth": birth, "anniversary": anniversary],
                                       encoding: URLEncoding.queryString)
        }
    }
    
//    var validationType: Moya.ValidationType {
//        return .successAndRedirectCodes
//    }
    
    
    var headers: [String: String]? {
        var parameters = [APIEnvironment.headerKey: APIEnvironment.headerValue]
        
        switch self {
        case .getUser(accessToken: let accessToken):
            parameters["Authorization"] = "Bearer \(accessToken)"
        default:
            return parameters
        }
        return parameters
    }
}
