//
//  SignInWithAppleDelegate.swift
//  Authorization
//
//  Created by 지준용 on 2/27/24.
//

import SwiftUI
import AuthenticationServices

import Entity
import Utility


final class SignInWithAppleDelegate: NSObject {
    private weak var window: UIWindow!
    private let signInSucceeded: (Bool) -> Void
    
    init(window: UIWindow?, signInSucceeded: @escaping (Bool) -> Void) {
        self.window = window
        self.signInSucceeded = signInSucceeded
    }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return Logger.print(LoginServiceError.credentialNotFound)
        }
        
        if let _ = credential.email, let _ = credential.fullName {
            registerNewAccount(credential: credential)
        } else {
            signInWithExistingAccount(credential: credential)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        return Logger.print(error)
    }
}

extension SignInWithAppleDelegate {
    func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        let id = credential.user
        var name: String?
        
        if let familyName = credential.fullName?.familyName,
           let givenName = credential.fullName?.givenName {
            name = familyName + givenName
        }
        let email = credential.email
        let identityToken = credential.identityToken
        
        let user = SocialLoginUser(id: id,
                                   name: name,
                                   email: email,
                                   loginMethod: .apple)
        
//        let keychain = UserDataKeychain()
        
//        do {
//            try keychain.store(user) // 키체인 저장
//            print("keychain")
//        } catch {
//            self.signInSucceeded(false)
//        }
    }
    
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        self.signInSucceeded(true)
    }
}


extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window
    }
}
