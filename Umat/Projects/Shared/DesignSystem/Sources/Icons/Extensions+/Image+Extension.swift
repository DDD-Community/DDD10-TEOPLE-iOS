//
//  Image+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/4/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public extension Image {
    static func icons(_ icon: Icons) -> Image {
        return .init(icon.rawValue, bundle: .module)
    }
}

public extension UIImage {
    static func uiImageIcons(_ icon: Icons) -> UIImage {
        guard let image = UIImage(named: icon.rawValue, in: .module, compatibleWith: nil) else {
            return UIImage(systemName: "mappin")!
        }
        
        return image
    }
    
    func resizeAsIcon() -> UIImage {
        let size = CGSize(width: 36, height: 38)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return renderImage
    }
    
}
