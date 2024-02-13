//
//  TextInputType.swift
//  Entity
//
//  Created by 지준용 on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public enum TextInputType {
    case makeName
    case inputCode
    
    public var title: String {
        switch self {
        case .makeName:
            """
            서비스에 표시될
            이름을 적어주세요
            """
        case .inputCode:
            "커플 연결 후 시작하기"
        }
    }
    
    public var subTitle: String {
        switch self {
        case .makeName:
            ""
        case .inputCode:
            "커플 코드를 아래에 작성해주세요."
        }
    }
    
    public var guidanceText: String {
        switch self {
        case .makeName:
            "내가 불리게 될 닉네임을 적어주세요"
        case .inputCode:
            "초대코드 붙여넣기"
        }
    }
    
    public var placeholder: String {
        switch self {
        case .makeName:
            "예) 밍밍이"
        case .inputCode:
            "코드 양식은 xxxxxx입니다."
        }
    }
}
