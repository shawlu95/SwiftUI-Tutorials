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
    // now a computed property passed to the Map initializer as a constant binding.
    // @State private var region = MKCoordinateRegion()

    // Use a storage key that uniquely identifies the parameter
    // like you would when storing items in UserDefaults
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    /*
     By prefixing a state variable with $, you pass a
     binding, which is like a reference to the underlying
     value. When the user interacts with the map, the map
     updates the region value to match the part of the map
     that’s currently visible in the user interface.
     */
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
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
