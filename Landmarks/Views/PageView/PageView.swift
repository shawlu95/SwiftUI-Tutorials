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
    @State private var currentPage = 1

    var body: some View {
        // Remember to use the $ syntax to create a binding to a value that is stored as state.
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
        }
    }
}

#Preview {
    // pass the required array of views
    PageView(pages: ModelData().features.map {FeatureCard(landmark: $0) })
        .aspectRatio(3 / 2, contentMode: .fit)
}
