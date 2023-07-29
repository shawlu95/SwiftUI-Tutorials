//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            /*
             When you specify only the height parameter, the
             view automatically sizes to the width of its
             content. In this case, MapView expands to fill
             the available space.
             */
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            // Each modifier returns a new view,
            // so it’s common to chain multiple modifiers
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                /*
                 When you apply a modifier to a layout view
                 like a stack, SwiftUI applies the modifier
                 to all the elements contained in the group.
                 */
                HStack {
                    Text(landmark.park)
                    // A spacer expands to make its containing view use all of the space of its parent view,
                    // instead of having its size defined only by its contents
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[1])
}
