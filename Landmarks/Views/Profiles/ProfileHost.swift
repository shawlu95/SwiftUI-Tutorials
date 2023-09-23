//
//  ProfileHost.swift
//  Landmarks
//
//  Created by main on 2023/9/22.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            ProfileSummary(profile: modelData.profile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environmentObject(ModelData())
}
