//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[1])
}
