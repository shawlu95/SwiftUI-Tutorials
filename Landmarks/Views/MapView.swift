/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that presents a map.
*/

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    /* You use the @State attribute to establish a source
     of truth for data in your app that you can modify from
     more than one view. SwiftUI manages the underlying
     storage and automatically updates views that depend on
     the value.
     */
    @State private var region = MKCoordinateRegion()

    /*
     By prefixing a state variable with $, you pass a
     binding, which is like a reference to the underlying
     value. When the user interacts with the map, the map
     updates the region value to match the part of the map
     that’s currently visible in the user interface.
     */
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286,
            longitude: -116.166_868))
    }
}
