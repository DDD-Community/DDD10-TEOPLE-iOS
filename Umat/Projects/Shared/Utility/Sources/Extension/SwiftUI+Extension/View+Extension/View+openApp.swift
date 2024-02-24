//
//  View+openApp.swift
//  Utility
//
//  Created by 지준용 on 2/24/24.
//

import SwiftUI

public extension View {
    func openNaverMapApp() {
        let url = "nmap:"
        
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
        }
        else {
            debugPrint("openError : 디바이스 외부 앱 열기 실패")
        }
    }
}
