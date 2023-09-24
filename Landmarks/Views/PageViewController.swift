//
//  PageViewController.swift
//  Landmarks
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    
    // SwiftUI calls this method a single time when it’s ready to display the view
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)


        return pageViewController
    }
    
    // For now, you create the UIHostingController that hosts the page SwiftUI view on every update.
    // Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
                    [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }


}
