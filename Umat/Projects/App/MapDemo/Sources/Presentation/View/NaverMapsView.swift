//
//  NaverMapsView.swift
//  MapDemo
//
//  Created by Gordon Choi on 1/11/24.
//  Copyright © 2024 TEOPLE. All rights reserved.
//

import UIKit
import SwiftUI

import NMapsMap

struct NaverMapsView: UIViewRepresentable {
    func makeUIView(context: Context) -> NMFMapView {
        let view = NMFMapView()
        
        return view
    }
    
    func updateUIView(_ uiView: NMFMapView, context: Context) {
        // ...
    }
}
