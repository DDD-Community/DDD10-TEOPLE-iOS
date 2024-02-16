//
//  UINavigationController+Extension.swift
//  DesignSystem
//
//  Created by 지준용 on 2/15/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return !viewControllers.isEmpty
    }
}
