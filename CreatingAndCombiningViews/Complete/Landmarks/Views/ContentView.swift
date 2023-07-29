/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

// conforms to the View protocol and describes the view’s content and layout.
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

// declares a preview for that view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
