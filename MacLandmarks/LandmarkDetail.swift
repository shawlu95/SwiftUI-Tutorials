//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    
                    // Add a resizable() modifier to the image,
                    // and constrain the CircleImage to be a bit smaller.
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            Spacer()
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack (alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            // improves readability when the user makes the window very wide.
            .frame(maxWidth: 700)
            // apply a smaller offset to the entire
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}
