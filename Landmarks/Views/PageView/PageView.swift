//
//  PageView.swift
//  Landmarks
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

// create a custom view to present UIViewControllerRepresentable view.
struct PageView<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController(pages: pages)
    }
}

#Preview {
    // pass the required array of views
    PageView(pages: ModelData().features.map {FeatureCard(landmark: $0) })
        .aspectRatio(3 / 2, contentMode: .fit)
}
