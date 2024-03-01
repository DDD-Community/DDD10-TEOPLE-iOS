//
//  SocialLoginUser.swift
//  Authorization
//
//  Created by 지준용 on 2/27/24.
//

import Foundation
import Entity

public struct SocialLoginUser: Codable {
    
    // MARK: - Properties
    public let id: String
    public var name: String?
    public var email: String?
    public let loginMethod: LoginMethod
    
    // MARK: - Init
    public init(id: String,
                name: String?,
                email: String?,
                loginMethod: LoginMethod) {
        self.id = id
        self.name = name ?? ""
        self.email = email ?? ""
        self.loginMethod = loginMethod
    }
}
