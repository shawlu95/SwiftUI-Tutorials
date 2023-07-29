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
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
            .previewLayout(.fixed(width: 300, height: 70))
        LandmarkRow(landmark: landmarks[1])
            .previewLayout(.fixed(width: 300, height: 70))
        LandmarkRow(landmark: landmarks[2])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
