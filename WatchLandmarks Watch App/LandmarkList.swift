//
//  LandmarkList.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    // The modelData property gets its value automatically,
    // as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    
    // Always mark state properties as private because state
    // should be specific to a view and its child views.
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            // Lists work with identifiable data.
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkList().environmentObject(ModelData())
}
