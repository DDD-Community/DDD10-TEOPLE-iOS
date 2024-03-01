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
        guard let file = Bundle.main.path(forResource: "Keys", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource["GoogleAPIKey"] as? String else {
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
            return "findplacefromtext/json"
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
        case .searchPlace(let keyword):
            return .requestParameters(
                parameters: [
                    "key": googleAPIKey ?? "",
                    "input": keyword,
                    "inputtype": "textquery",
                    "fields": "formatted_address,name,rating,opening_hours,geometry,place_id,photo"
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .searchPlace(let string):
            return nil
        }
    }
}
