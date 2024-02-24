//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by 지준용 on 2/24/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import UIKit
import Social
import UniformTypeIdentifiers

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        return !self.contentText.isEmpty
    }

    override func didSelectPost() {
        
        // TODO: - "올리기"버튼을 눌렀을 때, 검색창에 입력되도록 전달.
        // 단, [네이버 지도] 등의 단어는 제외
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        return []
    }
}
