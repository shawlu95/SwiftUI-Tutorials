//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    // add as stored property
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    // A view’s children inherit the view’s contextual settings, such as preview configurations.
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
        LandmarkRow(landmark: ModelData().landmarks[2])
    }
    .previewLayout(.fixed(width: 300, height: 70))
}
