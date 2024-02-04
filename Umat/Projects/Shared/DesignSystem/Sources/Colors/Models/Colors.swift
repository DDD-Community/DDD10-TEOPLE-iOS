//
//  Colors.swift
//  DesignSystem
//
//  Created by 지준용 on 2/3/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public enum Colors {
    
    // MARK: - Gray
    case gray50
    case gray100
    case gray200
    case gray300
    case gray400
    case gray500
    case gray600
    case gray700
    case gray800
    case gray900
    case gray950
    
    // MARK: - UserColor
    case orange50
    case orange100
    case orange200
    case orange300
    case orange400
    case orange500
    case orange600
    case orange700
    case orange800
    case orange900
    case orange950
    case blue50
    case blue100
    case blue200
    case blue300
    case blue400
    case blue500
    case blue600
    case blue700
    case blue800
    case blue900
    case blue950
    case both
    
    // MARK: - StateColor
    case error
    case success
    
    // MARK: - Reaction
    case like
    case love
    case notGood
    case soso
    
    var hex: String {
        switch self {
        
        // MARK: Gray
        case .gray50:
            return "#F9FAFB"
        case .gray100:
            return "#F3F4F6"
        case .gray200:
            return "#E5E7EB"
        case .gray300:
            return "#D1D5DB"
        case .gray400:
            return "#9CA3AF"
        case .gray500:
            return "#6B7280"
        case .gray600:
            return "#4B5563"
        case .gray700:
            return "#374151"
        case .gray800:
            return "#1F2937"
        case .gray900:
            return "#111827"
        case .gray950:
            return "#030712"
            
        // MARK: UserColor
        case .orange50:
            return "#FFF5EC"
        case .orange100:
            return "#FFE9D3"
        case .orange200:
            return "#FFCFA5"
        case .orange300:
            return "#FFAD6D"
        case .orange400:
            return "#FF7E32"
        case .orange500:
            return "#FF5B0A"
        case .orange600:
            return "#FF4000"
        case .orange700:
            return "#CC2B02"
        case .orange800:
            return "#A1220B"
        case .orange900:
            return "#821F0C"
        case .orange950:
            return "#460C04"
        case .blue50:
            return "#EEF2FF"
        case .blue100:
            return "#E0E7FF"
        case .blue200:
            return "#C7D2FE"
        case .blue300:
            return "#A5B4FC"
        case .blue400:
            return "#818CF8"
        case .blue500:
            return "#6366F1"
        case .blue600:
            return "#4F46E5"
        case .blue700:
            return "#4338CA"
        case .blue800:
            return "#3730A3"
        case .blue900:
            return "#312E81"
        case .blue950:
            return "#1E1B4B"
        case .both:
            return "#a855f7"
            
        // MARK: StateColor
        case .error:
            return "#F43F5E"
        case .success:
            return "#3B82F6"
            
        // MARK: Reaction
        case .like:
            return "#FF4949"
        case .love:
            return "#FDD842"
        case .notGood:
            return "#FF85B9"
        case .soso:
            return "#01E39B"
        }
    }
}

public extension Colors {
    var color: Color {
        .colors(self)
    }
}
