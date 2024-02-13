//
//  ActivitySheet.swift
//  DesignSystem
//
//  Created by 지준용 on 2/13/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI
import UIKit


public extension View {
    func activitySheet(_ item: Binding<ActivityItem?>,
                       onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) -> some View {
        background {
            ActivityView(item: item, onComplete: onComplete)
        }
    }
}

public struct ActivityItem {
    var items: [Any]
    var activities: [UIActivity]
    
    public init(items: Any..., activities: [UIActivity] = []) {
        self.items = items
        self.activities = activities
    }
}

struct ActivityView: UIViewControllerRepresentable {
    
    @Binding var item: ActivityItem?
    var completion: UIActivityViewController.CompletionWithItemsHandler?
    
    init(item: Binding<ActivityItem?>,
         onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) {
        self._item = item
        self.completion = onComplete
    }
    
    func makeUIViewController(context: Context) -> ActivityViewControllerWrapper {
        ActivityViewControllerWrapper(item: $item, completion: completion)
    }
    
    func updateUIViewController(_ controller: ActivityViewControllerWrapper, context: Context) {
        controller.item = $item
        controller.completion = completion
        controller.updateState()
    }
}

final class ActivityViewControllerWrapper: UIViewController {
    
    var item: Binding<ActivityItem?>
    var completion: UIActivityViewController.CompletionWithItemsHandler?
    
    init(item: Binding<ActivityItem?>,
         completion: UIActivityViewController.CompletionWithItemsHandler?) {
        self.item = item
        self.completion = completion
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateState() {
        let isActivityPresented = presentedViewController != nil
        
        if item.wrappedValue != nil && !isActivityPresented {
            let controller = UIActivityViewController(
                activityItems: item.wrappedValue?.items ?? [],
                applicationActivities: item.wrappedValue?.activities
            )
            
            controller.completionWithItemsHandler = { [weak self] (activityType, success, items, error) in
                self?.item.wrappedValue = nil
                self?.completion?(activityType, success, items, error)
            }
            
            present(controller, animated: true, completion: nil)
        }
    }
}
