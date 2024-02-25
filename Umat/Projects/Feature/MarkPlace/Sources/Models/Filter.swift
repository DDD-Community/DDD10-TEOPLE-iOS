//
//  Filter.swift
//  MarkPlace
//
//  Created by 지준용 on 2/25/24.
//

import SwiftUI

import Entity


struct Filter {
    let name: String
    var wishList: [Place]
    let key: String
    let color: Color
    var isSelected: Bool
    var isUpdated: Bool
}
