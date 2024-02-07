//
//  NaverMapView.swift
//  UmaiDemo
//
//  Created by Gordon Choi on 2/7/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import NMapsMap

struct NaverMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        
    }
}
