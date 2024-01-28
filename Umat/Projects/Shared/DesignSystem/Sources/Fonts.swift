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
        
        case pb16
        case pb12
        
        // MARK: Pretendard-SemiBold
        
        case ps18
        case ps16
        case ps14
        case ps12
        
        // MARK: Pretendard-Medium
        
        case pm16
        case pm12
        
        // MARK: Pretendard-Regular
        
        case pr16
        case pr12
        
        // MARK: Properties
        
        var design: Pretendard {
            switch self {
            case .pb16:
                return .bold
            case .pb12:
                return .bold
                
            case .ps18:
                return .semiBold
            case .ps16:
                return .semiBold
            case .ps14:
                return .semiBold
            case .ps12:
                return .semiBold
                
            case .pm16:
                return .medium
            case .pm12:
                return .medium
                
            case .pr16:
                return .regular
            case .pr12:
                return .regular
            }
        }
        
        var size: CGFloat {
            switch self {
            case .pb16:
                return 16
            case .pb12:
                return 12
                
            case .ps18:
                return 18
            case .ps16:
                return 16
            case .ps14:
                return 14
            case .ps12:
                return 12
                
            case .pm16:
                return 16
            case .pm12:
                return 12
                
            case .pr16:
                return 16
            case .pr12:
                return 12
            }
        }
    }
}

// MARK: - LINE Seed Sans

extension Fonts {
    public enum LINEFonts {
        
        // MARK: LINESeedSansKR-Bold
        
        case lb20
        case lb18
        case lb16
        case lb12
        
        // MARK: LINESeedSansKR-Regular
        
        case lr14
        
        // MARK: Properties
        
        var design: LINESeedSans {
            switch self {
            case .lb20:
                return .bold
            case .lb18:
                return .bold
            case .lb16:
                return .bold
            case .lb12:
                return .bold
            case .lr14:
                return .regular
            }
        }
        
        var size: CGFloat {
            switch self {
            case .lb20:
                return 20
            case .lb18:
                return 18
            case .lb16:
                return 16
            case .lb12:
                return 12
            case .lr14:
                return 14
            }
        }
    }
}
