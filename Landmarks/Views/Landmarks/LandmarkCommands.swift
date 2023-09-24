//
//  LandmarkCommands.swift
//  MacLandmarks
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkCommands: Commands {
    // Add a @FocusedBinding property wrapper to track the currently selected landmark.
    // read the value here, set the value from list view
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    var body: some Commands {
        // This built-in command set includes the command for toggling the sidebar.
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option]) // displayed in menu
            .disabled(selectedLandmark == nil)
        }
    }
}

// extend the FocusedValues structure with a selectedLandmark value,
// using a custom key called SelectedLandmarkKey.
private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

// The pattern for defining focused values resembles the pattern for
// defining new Environment values: Use a private key to read and
// write a custom property on the system-defined FocusedValues structure.
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
