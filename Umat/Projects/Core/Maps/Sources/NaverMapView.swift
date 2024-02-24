//
//  NaverMapView.swift
//  Maps
//
//  Created by Gordon Choi on 2/21/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

import NMapsMap

public struct NaverMapView: UIViewRepresentable {
    public init() { }
    
    public func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    
    public func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        
    }
}
