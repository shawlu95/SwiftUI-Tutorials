/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The top-level definition of the Landmarks app.
*/

import SwiftUI

// The @main attribute identifies the app’s entry point.
@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    // The structure’s body property returns one or more scenes,
    // which in turn provide content for display
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                // You apply this modifier so that views further down
                // in the view hierarchy can read data objects passed down through the environment.
        }
        // Scene modifiers work like view modifiers, 
        // except that you apply them to scenes instead of views.
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        // add Setting scene for macOS
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
