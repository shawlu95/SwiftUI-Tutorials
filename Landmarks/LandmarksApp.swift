/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The top-level definition of the Landmarks app.
*/

import SwiftUI

// The @main attribute identifies the app’s entry point.
@main
struct LandmarksApp: App {
    // The structure’s body property returns one or more scenes,
    // which in turn provide content for display
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
