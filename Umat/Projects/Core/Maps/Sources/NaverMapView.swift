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

import NMapsMap
import NMapsGeometry

public struct NaverMapView: UIViewRepresentable {
    var location: CLLocationCoordinate2D?
    
    public init(location: CLLocationCoordinate2D? = nil) {
        self.location = location
    }
    
    public func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    
    public func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        guard let location else { return }
        
        let newLocation = NMGLatLng(lat: location.latitude, lng: location.longitude)
        let newFocus = NMFCameraUpdate(scrollTo: newLocation)
        newFocus.animation = .fly
        newFocus.animationDuration = 1
        uiView.mapView.moveCamera(newFocus)
    }
}
