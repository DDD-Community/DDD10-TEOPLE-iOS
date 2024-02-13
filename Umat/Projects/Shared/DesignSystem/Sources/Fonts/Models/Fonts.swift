//
//  Fonts.swift
//  DesignSystem
//
//  Created by 지준용 on 1/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public enum Fonts {}

// MARK: - Pretendard
extension Fonts {
    public enum PretendardFonts {
        
        // MARK: Pretendard-Bold
        case bold16
        case bold12
        
        // MARK: Pretendard-SemiBold
        case semiBold18
        case semiBold16
        case semiBold14
        case semiBold12
        case semiBold10
        
        // MARK: Pretendard-Medium
        case medium16
        case medium12
        
        // MARK: Pretendard-Regular
        case regular16
        case regular12
        
        // MARK: Properties
        var design: Pretendard {
            switch self {
            case .bold16:
                return .bold
            case .bold12:
                return .bold
                
            case .semiBold18:
                return .semiBold
            case .semiBold16:
                return .semiBold
            case .semiBold14:
                return .semiBold
            case .semiBold12:
                return .semiBold
            case .semiBold10:
                return .semiBold
                
            case .medium16:
                return .medium
            case .medium12:
                return .medium
                
            case .regular16:
                return .regular
            case .regular12:
                return .regular
            }
        }
        
        var size: CGFloat {
            switch self {
            case .bold16:
                return 16
            case .bold12:
                return 12
                
            case .semiBold18:
                return 18
            case .semiBold16:
                return 16
            case .semiBold14:
                return 14
            case .semiBold12:
                return 12
            case .semiBold10:
                return 10
                
            case .medium16:
                return 16
            case .medium12:
                return 12
                
            case .regular16:
                return 16
            case .regular12:
                return 12
            }
        }
    }
}

// MARK: - LINE Seed Sans
extension Fonts {
    public enum LINEFonts {
        
        // MARK: LINESeedSansKR-Bold
        case bold20
        case bold18
        case bold16
        case bold12
        
        // MARK: LINESeedSansKR-Regular
        case regular14
        
        // MARK: Properties
        var design: LINESeedSans {
            switch self {
            case .bold20:
                return .bold
            case .bold18:
                return .bold
            case .bold16:
                return .bold
            case .bold12:
                return .bold
                
            case .regular14:
                return .regular
            }
        }
        
        var size: CGFloat {
            switch self {
            case .bold20:
                return 20
            case .bold18:
                return 18
            case .bold16:
                return 16
            case .bold12:
                return 12
                
            case .regular14:
                return 14
            }
        }
    }
}
