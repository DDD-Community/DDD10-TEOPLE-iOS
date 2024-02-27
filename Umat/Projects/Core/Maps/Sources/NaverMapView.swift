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
    var location: CLLocationCoordinate2D?
    var isLocalAreaMarked: Bool
    
    public init(location: CLLocationCoordinate2D? = nil, isLocalAreaMarked: Bool) {
        self.location = location
        self.isLocalAreaMarked = isLocalAreaMarked
    }
    
    public func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        
        view.showZoomControls = false
        view.showLocationButton = true
        
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        view.mapView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        
        return view
    }
    
    public func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        guard let location else { return }
        
        let newLocation = NMGLatLng(lat: location.latitude, lng: location.longitude)
        let newFocus = NMFCameraUpdate(scrollTo: newLocation)
        newFocus.animation = .fly
        newFocus.animationDuration = 1
        uiView.mapView.moveCamera(newFocus)
        
        if isLocalAreaMarked {
            Logger.print("Draw circle")
            let mapView = uiView.mapView
            let projection = mapView.projection
            
            let leftCoord = projection.latlng(from: CGPoint(x: 0, y: uiView.bounds.height / 2)).toCLLocation()
            let rightCoord = projection.latlng(from: CGPoint(x: uiView.bounds.width, y: uiView.bounds.height / 2)).toCLLocation()
            let distance = rightCoord.distance(from: leftCoord)
            
            let center = mapView.cameraPosition.target
            let radius = distance / 2
            let overlay = NMFCircleOverlay(center, radius: radius)
            
            overlay.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            overlay.mapView = mapView
            
            // 오버레이 원 안에 있는 핀 갯수 파악하기
        } else {
            // 원형 오버레이 지우기
            
            // 전체 갯수로 수정하기
        }
    }
}

extension NMGLatLng {
    func toCLLocation() -> CLLocation {
        return CLLocation(latitude: self.lat, longitude: self.lng)
    }
}

