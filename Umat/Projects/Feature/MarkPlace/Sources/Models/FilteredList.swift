//
//  FilteredList.swift
//  MarkPlace
//
//  Created by 지준용 on 2/25/24.
//

import SwiftUI

import Entity

struct Tab {
    let name: String
    let key: String
    let color: Color
}

struct FilteredList {
    let tab: Tab
    var wishList: [Place]
    var isSelected: Bool
    var isUpdated: Bool
}
