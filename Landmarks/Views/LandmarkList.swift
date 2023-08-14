//
//  LandmarkList.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            // Lists work with identifiable data.
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
            
        }
    }
}

#Preview {
    /*
     ForEach operates on collections the same way as the list, which
     means you can use it anywhere you can use a child view, such as
     in stacks, lists, groups, and more. When the elements of your
     data are simple value types — like the strings you’re using here
     — you can use \.self as key path to the identifier.*/
    ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
    }
}
