//
//  UINavigationController+gesture.swift
//  DesignSystem
//
//  Created by 지준용 on 2/15/24.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return !viewControllers.isEmpty
    }
}
