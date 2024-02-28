//
//  APIService.swift
//  Networking
//
//  Created by Gordon Choi on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

import Utility

import CombineMoya
import Moya

public enum APIService {
    case searchPlace(String)
    
    var googleAPIKey: String? {
        // TODO: 각각의 조건을 한 번에 검사하도록 변경
        guard let file = Bundle.main.path(forResource: "Keys", ofType: "plist") else {
            Logger.print("No file")
            return nil
        }
        
        guard let resource = NSDictionary(contentsOfFile: file) else {
            Logger.print("Failed to dictionarize")
            return nil
        }
        
        guard let key = resource["GoogleAPIKey"] as? String else {
            Logger.print("Failed to get key")
            return nil
        }
        
        return key
    }
}

extension APIService: TargetType {
    public var baseURL: URL {
        switch self {
        case .searchPlace:
            return URL(string: "https://maps.googleapis.com/maps/api/place")!
        }
    }
    
    public var path: String {
        switch self {
        case .searchPlace:
            return "textsearch/json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchPlace:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .searchPlace(let quote):
            return .requestParameters(parameters: ["key": googleAPIKey ?? "", "query": quote], encoding: URLEncoding.queryString)
        }
    }
    
   public var headers: [String : String]? {
        nil
    }
}
