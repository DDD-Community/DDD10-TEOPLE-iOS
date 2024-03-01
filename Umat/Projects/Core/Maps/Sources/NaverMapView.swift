//
//  NaverMapView.swift
//  Maps
//
//  Created by Gordon Choi on 2/21/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import CoreLocation
import SwiftUI

import Entity
import Utility

import NMapsMap
import NMapsGeometry

public struct NaverMapView: UIViewRepresentable {
    var isLocalAreaMarked: Bool
    
    public init(isLocalAreaMarked: Bool) {
        self.isLocalAreaMarked = isLocalAreaMarked
    }
    
    public func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.removeAllItems()
        return context.coordinator.makeMapView()
    }
    
    public func updateUIView(_ uiView: NMFNaverMapView, context: Context) {        
        if isLocalAreaMarked {
            context.coordinator.createCircle()
            
            // 오버레이 원 안에 있는 핀 갯수 파악하기
        } else {
            context.coordinator.deleteCircle()
            
            // 전체 갯수로 수정하기
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator.shared
    }
}

extension NMGLatLng {
    func toCLLocation() -> CLLocation {
        return CLLocation(latitude: self.lat, longitude: self.lng)
    }
}

