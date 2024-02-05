//
//  Icons.swift
//  DesignSystem
//
//  Created by 지준용 on 2/4/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public enum Icons: String {
    
    // MARK: - Filled Icon
    case ic_add_filled
    case ic_arrow_back_filled
    case ic_arrow_forward_filled
    case ic_calender_filled
    case ic_heart_filled
    case ic_location_check_filled
    case ic_location_filled
    
    // MARK: - Outlined Icon
    case ic_cancel_outlined
    case ic_check_outlined
    case ic_clock_outlined
    case ic_current_location_outlined
    case ic_edit_outlined
    case ic_heart_outlined
    case ic_home_outlined
    case ic_money_outlined
    case ic_more_outlined
    case ic_my_outlined
    case ic_refresh_outlined
    case ic_search_outlined
    case ic_settings_outlined
    case ic_share_outlined
    case ic_star_outlined
    case ic_warning_outlined
}

public extension Icons {
    var image: Image {
        .icons(self)
    }
}
