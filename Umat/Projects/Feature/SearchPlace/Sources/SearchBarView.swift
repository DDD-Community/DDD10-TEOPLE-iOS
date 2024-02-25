//
//  SearchBarView.swift
//  SearchPlace
//
//  Created by Gordon Choi on 2/25/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import CoreLocation
import SwiftUI

import DesignSystem
import Utility

public struct SearchBarView: View {
    @State private var inputText: String = ""
    @Binding var location: CLLocationCoordinate2D
    
    public var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Button {
                        Logger.print("Search button tapped")
                    } label: {
                        Image.icons(.ic_search_outlined)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 8)
                    
                    TextField("공간명 검색", text: $inputText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 46)
                }
                .background(Color.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
                .shadow(radius: 4)
                
                MyLocationButton {
                    Logger.print("My location button tapped")
                    
                    // TODO: 사용자 위치 권한 획득한 후 사용자 위치로 조정
                    toggleLocation()
                }
                    .background(Color.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .shadow(radius: 4)
            }
            .padding(.horizontal, 24)
            
            
            Spacer()
        }
    }
    
    public init(location: Binding<CLLocationCoordinate2D>) {
        self._location = location
    }
    
    #if DEBUG
    private func toggleLocation() {
        if location.latitude == 37.5000873 && location.longitude == 127.0272858 {
            location = CLLocationCoordinate2D(latitude: 37.5453577, longitude: 126.9525465)
        } else {
            location = CLLocationCoordinate2D(latitude: 37.5000873, longitude: 127.0272858)
        }
    }
    #endif
}
