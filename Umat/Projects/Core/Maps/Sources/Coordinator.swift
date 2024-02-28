//
//  Coordinator.swift
//  Maps
//
//  Created by Gordon Choi on 2/28/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import NMapsMap
import NMapsGeometry

public final class Coordinator: NSObject, ObservableObject, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate {
    static let shared = Coordinator()
    
    @Published var userLocation = (0.0, 0.0)
    @Published var markers: [NMFMarker] = []
    @Published var circle: [NMFCircleOverlay] = []
    
    let view = NMFNaverMapView(frame: .zero)
    
    private override init() { }
    
    public func makeMapView() -> NMFNaverMapView {
        view.showZoomControls = false
        view.showLocationButton = true
        
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        view.mapView.contentInset = UIEdgeInsets(top: 46, left: 0, bottom: 200, right: 0)
        return view
    }
    
    // 마커 생성
    func createMarkers(_ markers: [NMFMarker]) {
        
    }
    
    // 마커 삭제
    func deleteMarkers() {
        markers.forEach {
            $0.mapView = nil
        }
        
        markers.removeAll()
    }
    
    // 오버레이 생성
    public func createCircle() {
        let mapView = view.mapView
        let projection = mapView.projection
        
        let leftCoord = projection.latlng(from: CGPoint(x: 0, y: view.bounds.height / 2)).toCLLocation()
        let rightCoord = projection.latlng(from: CGPoint(x: view.bounds.width, y: view.bounds.height / 2)).toCLLocation()
        let distance = rightCoord.distance(from: leftCoord)
        
        let center = mapView.cameraPosition.target
        let radius = distance / 2
        let overlay = NMFCircleOverlay(center, radius: radius)
        
        overlay.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        overlay.mapView = mapView
        circle.append(overlay)
    }
    
    // 오버레이 삭제
    public func deleteCircle() {
        circle.forEach {
            $0.mapView = nil
        }
        
        circle.removeAll()
    }
    
    public func removeAllItems() {
        deleteMarkers()
        deleteCircle()
    }
    
    // 현위치 추적 및 반영
    // 마커 선택 시 액션
}
