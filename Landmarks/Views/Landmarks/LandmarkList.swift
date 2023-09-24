//
//  LandmarkList.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    // The modelData property gets its value automatically,
    // as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    
    // Always mark state properties as private because state
    // should be specific to a view and its child views.
    @State private var showFavoritesOnly = false
    
    // By storing the filter state in the list view, 
    // the user can open multiple list view windows,
    // each with its own filter setting, to be able
    // to look at the data in different ways.
    @State private var filter = FilterCategory.all
    
    @State private var selectedLandmark: Landmark?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    // a computed property that indicates the index of the selected landmark
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView {
            // Lists work with identifiable data.
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            // This improves the preview, but also ensures that
            // the list never becomes too small as the user
            // resizes the macOS window.
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        // Because the filter has only a few items,
                        // you use the inline picker style to make
                        // them all appear together.
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            // Adding the second child view automatically
            // converts the list to use the sidebar list style.
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    /*
     ForEach operates on collections the same way as the list, which
     means you can use it anywhere you can use a child view, such as
     in stacks, lists, groups, and more. When the elements of your
     data are simple value types — like the strings you’re using here
     — you can use \.self as key path to the identifier.*/
    ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
            .environmentObject(ModelData())
    }
}
