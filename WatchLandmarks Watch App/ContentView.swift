//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
